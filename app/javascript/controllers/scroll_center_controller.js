import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-center"
export default class extends Controller {
  static targets = ["currentYear"]

  connect() {
    if (this.hasCurrentYearTarget) {
      // Small timeout to ensure layout has finished rendering and sizes are accurate
      setTimeout(() => {
        this.centerOnTarget(this.currentYearTarget)
      }, 50)
    }
  }

  centerOnTarget(target) {
    const container = this.element
    
    // Calculate the position to scroll to so the target is perfectly centered
    const containerHalfWidth = container.offsetWidth / 2
    const targetHalfWidth = target.offsetWidth / 2
    
    // Account for padding or margins on the container if needed (e.g. scrollLeft = offsetLeft - containerHalfWidth + targetHalfWidth)
    const scrollPosition = target.offsetLeft - containerHalfWidth + targetHalfWidth

    // Smoothly scroll the container to the calculated position
    container.scrollTo({
      left: scrollPosition,
      behavior: 'smooth'
    })
  }
}
