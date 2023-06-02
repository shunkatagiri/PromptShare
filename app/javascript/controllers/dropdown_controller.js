import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu" ]

  connect() {
    console.log("Connected to dropdown menu controller.")
  }

  toggle() {
    this.menuTarget.classList.toggle('hidden')
  }
}
