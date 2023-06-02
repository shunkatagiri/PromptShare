import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu" ]

  connect() {
    console.log("Connected to dropdown menu controller.")
    this.menuTarget.classList.add('hidden') // 追加
  }

  toggle() {
    this.menuTarget.classList.toggle('hidden')
  }
}
