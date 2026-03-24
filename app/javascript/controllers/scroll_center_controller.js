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

  scrollToYear(event) {
    const year = event.currentTarget.dataset.year
    if (!year) return
    
    const target = document.getElementById(`year_${year}`)
    if (target) {
      this.centerOnTarget(target)
      
      // Update styling of buttons
      const buttons = this.element.parentElement.querySelectorAll('button[data-year]')
      buttons.forEach(btn => {
        if (btn.dataset.year === year) {
          btn.classList.add('bg-indigo-100', 'text-indigo-700')
          btn.classList.remove('bg-slate-100', 'text-slate-600', 'hover:bg-slate-200')
        } else {
          btn.classList.remove('bg-indigo-100', 'text-indigo-700')
          btn.classList.add('bg-slate-100', 'text-slate-600', 'hover:bg-slate-200')
        }
      })
    }
  }
}
