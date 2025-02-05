import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['slideover']

  open () {
    this.slideoverTarget.classList.remove('hidden')
  }

  close () {
    this.slideoverTarget.classList.add('hidden')
  }
}
