// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// import "bootstrap"

// Event listener registration
document.addEventListener("DOMContentLoaded", function() {
    // This ensures the DOM is fully loaded before registering the listener
    document.addEventListener("profileAdded", function(e) {
        console.log(e.detail.message); // Logs: "A profile has been added"
        const add_button = document.getElementById("add_profile");
        if (add_button) {
            add_button.style.display = 'block';
        } else {
            console.error("add_profile element not found");
        }
    });
});

// MutationObserver setup
document.addEventListener("DOMContentLoaded", function() {
    const observer = new MutationObserver((mutationsList, observer) => {
        for (const mutation of mutationsList) {
            if (mutation.type === 'childList') {
                if (mutation.addedNodes.length > 0) {
                    const event = new CustomEvent("profileAdded", {
                        detail: {
                            message: "A profile has been added",
                        }
                    });
                    document.dispatchEvent(event);
                }
            }
        }
    });
    
    const config = { childList: true };
    const targetNode = document.getElementById('profile');
    
    if (targetNode) {
        observer.observe(targetNode, config);
    } else {
        console.error("Target node '#profile' not found");
    }
});


document.addEventListener("turbo:load", function() {
    const addButton = document.getElementById("add_profile");
    if (addButton) {
        addButton.addEventListener("click", function() {
        this.style.display = 'none';
        });
        
    }
});