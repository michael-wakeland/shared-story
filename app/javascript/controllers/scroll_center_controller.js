import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-center"
export default class extends Controller {
  static targets = ["currentYear", "container"]

  connect() {
    this.isDown = false
    this.startX = 0
    this.scrollLeft = 0

    if (this.hasCurrentYearTarget) {
      // Small timeout to ensure layout has finished rendering and sizes are accurate
      setTimeout(() => {
        this.centerOnTarget(this.currentYearTarget)
      }, 100)
    }
  }

  dragStart(e) {
    this.isDown = true
    this.containerTarget.style.scrollSnapType = 'none'
    this.startX = e.pageX - this.containerTarget.offsetLeft
    this.scrollLeft = this.containerTarget.scrollLeft
  }

  dragEnd() {
    this.isDown = false
    this.containerTarget.style.scrollSnapType = ''
  }

  drag(e) {
    if (!this.isDown) return
    e.preventDefault()
    const x = e.pageX - this.containerTarget.offsetLeft
    const walk = (x - this.startX) * 2 // Scroll-fast
    this.containerTarget.scrollLeft = this.scrollLeft - walk
  }

  centerOnTarget(target) {
    const container = this.hasContainerTarget ? this.containerTarget : this.element
    
    // Calculate the position relative to the container
    const containerRect = container.getBoundingClientRect()
    const targetRect = target.getBoundingClientRect()
    
    // The target's distance from the left of the container's viewport
    const relativeLeft = targetRect.left - containerRect.left
    
    // We want this relativeLeft to be equal to (containerWidth / 2 - targetWidth / 2)
    const desiredRelativeLeft = (containerRect.width / 2) - (targetRect.width / 2)
    
    // The amount we need to adjust scrollLeft by
    const scrollAdjustment = relativeLeft - desiredRelativeLeft
    
    container.scrollTo({
      left: container.scrollLeft + scrollAdjustment,
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
      const buttons = this.element.querySelectorAll('button[data-year]')
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
