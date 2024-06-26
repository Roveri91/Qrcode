import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  connect() {
  }

  close(e){
    e.preventDefault();
    
    const add_profile_btn = document.getElementById("add_profile");
    const modal = document.getElementById("modal");
    modal.innerHTML = "";

    modal.removeAttribute("src");

    modal.removeAttribute("complete");
    add_profile_btn.style.display='block'
  }

}
