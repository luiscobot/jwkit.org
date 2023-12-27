import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ['control'];
  
  toggle() {
    this.controlTargets.forEach(control => {
      control.toggleAttribute('disabled');

      if (!control.getAttribute('disabled')) {
        control.value = '';
      }
    });
  }
}
