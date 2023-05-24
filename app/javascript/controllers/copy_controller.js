// copy_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["buttonText", "icon"]

  copy(event) {
    const source = this.data.get("source");
    this.copyToClipboard(source);
  }

  async copyToClipboard(text) {
    try {
      await navigator.clipboard.writeText(text);
      this.copySuccess();
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  }

  copySuccess() {
    this.buttonTextTarget.textContent = "Copied";
    this.iconTarget.innerHTML = `
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-5 h-5" data-copy-target="icon">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
      </svg>
    `;
  }
}
