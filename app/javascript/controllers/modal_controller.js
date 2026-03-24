import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close(e) {
    if (e) {
      e.preventDefault()
    }
    // Remove the frame content
    const frame = document.getElementById("modal")
    if (frame) {
        frame.innerHTML = ""
        frame.removeAttribute("src")
    }
  }
}
