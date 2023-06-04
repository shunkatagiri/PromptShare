// app/javascript/controllers/modal_controller.js

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    console.log("Modal controller connected")
  }

  show(event) {
    event.preventDefault();
    this.modalTarget.innerHTML = '<div>モーダルの中身</div>';
  }

  close() {
    this.modalTarget.innerHTML = '';
  }
}
  