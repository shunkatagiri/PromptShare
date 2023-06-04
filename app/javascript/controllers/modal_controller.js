// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "overlay"]

  connect() {
    console.log("Modal controller connected")
  }

  open(event) {
    event.preventDefault()
    this.contentTarget.style.display = "block"
    this.overlayTarget.style.display = "block"
  }

  close() {
    this.contentTarget.style.display = "none"
    this.overlayTarget.style.display = "none"
  }
}
