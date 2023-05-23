import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source" ]

  copy(event) {
    event.preventDefault()

    navigator.clipboard.writeText(this.sourceTarget.textContent).then(() => {
      // コピー成功時の処理
      alert('Copied!');
    }).catch((error) => {
      // コピー失敗時の処理
      console.error('コピー失敗：', error);
    });
  }
}
