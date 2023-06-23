import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu" ]

  connect() {
    console.log("Connected to dropdown menu controller.")
    this.menuTarget.classList.add('hidden')
    // ページ全体へのクリックイベントリスナを追加
    document.addEventListener('click', this.outsideClick.bind(this))
  }

  disconnect() {
    // イベントリスナーを削除
    document.removeEventListener('click', this.outsideClick.bind(this))
  }

  toggle(event) {
    event.stopPropagation() // 追加
    this.menuTarget.classList.toggle('hidden')
  }

  outsideClick(event) {
    // メニューターゲットの外側がクリックされた場合、メニューを閉じる
    if (!this.menuTarget.contains(event.target) && !this.menuTarget.classList.contains('hidden')) {
      this.menuTarget.classList.add('hidden')
    }
  }
};
