// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// import "bootstrap"

document.addEventListener("turbo:load", function() {
    const addButton = document.getElementById("add_profile");
    if (addButton) {
        addButton.addEventListener("click", function() {
        this.style.display = 'none';
        });
        
    }
});

// Create a MutationObserver
const observer = new MutationObserver((mutationsList, observer) => {
    // Step 2: Define callback function
    for (const mutation of mutationsList) {
        if (mutation.type === 'childList') {
            // Check if children were added
            if (mutation.addedNodes.length > 0) {
                // Trigger custom event here
                const event = new CustomEvent("profileAdded", {
                    detail: {
                        message: "A profile has been added",
                        // You can add more details here if needed
                    }
                });
                document.dispatchEvent(event);
            }
        }
    }
});

// Step 3: Configure the observer
const config = { childList: true };

// Step 4: Select the target element
const targetNode = document.getElementById('profile');

// Step 5: Start observing
observer.observe(targetNode, config);


// Example of listening for the custom event

document.addEventListener("profileAdded", function(e) {
    console.log(e.detail.message); // Logs: "A profile has been added"
    const add_button = document.getElementById("add_profile");
    console.log(add_button)
    if (add_button) { // Check if add_button is not null
        add_button.style.display = 'block';
    } else {
        console.error("add_profile element not found");
    }
    
});
  