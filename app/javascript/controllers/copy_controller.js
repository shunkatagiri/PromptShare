import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source" ]

  copy(event) {
    event.preventDefault()

    const el = document.createElement('textarea')
    el.value = this.sourceTarget.textContent
    document.body.appendChild(el)
    el.select()
    document.execCommand('copy')
    document.body.removeChild(el)
  }
}
