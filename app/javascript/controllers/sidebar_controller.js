// app/javascript/controllers/sidebar_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "nav" ]

  connect() {
    console.log("Connected to sidebar controller.")
  }

  toggle() {
    this.navTarget.classList.toggle('hidden')
    this.navTarget.classList.toggle('block')
  }
}
