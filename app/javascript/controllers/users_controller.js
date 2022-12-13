import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  delete(event) {
    let confirmed = confirm("Você tem certeza?")

    if(!confirmed) {
      event.preventDefault()
    }
  }
}
