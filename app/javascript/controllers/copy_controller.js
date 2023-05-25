// copy_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["buttonText", "icon", "source"]

  copy(event) {
    const source = this.sourceTarget.textContent;
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

    setTimeout(() => {
      this.buttonTextTarget.textContent = "Copy";
      this.iconTarget.innerHTML = `
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-5 h-5">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
      </svg>
    `;
    }, 2000);
  }
}
