import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  submit() {
    this.element.requestSubmit()
  }
}
