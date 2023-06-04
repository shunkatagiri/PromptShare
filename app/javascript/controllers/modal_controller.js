// app/javascript/controllers/modal_controller.js

import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Modal controller connected")
  }

  show(event) {
    event.preventDefault();
    fetch(event.currentTarget.href, { headers: { accept: "text/html" } })
      .then(response => response.text())
      .then(data => {
        document.querySelector("#modal").innerHTML = data;
      });
  }

  close() {
    document.querySelector("#modal").innerHTML = '';
  }
}
