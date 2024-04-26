import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="otp"
export default class extends Controller {
  static targets = ["control"];

  connect() {
    this.inputs = Array.from(this.controlTarget.querySelectorAll("[data-control='otp']"));
  }

  validate(ev) {
    // allow digits (0-9) and letters (a-zA-Z).
    if (!/^[0-9a-zA-Z]{1}$/.test(ev.key) && ev.key !== "Backspace" && ev.key !== "Delete") {
      ev.preventDefault();
    }
  }

  select(ev) {
    ev.target.select();
  }

  paste(ev) {
    ev.preventDefault();
    let token = ev.clipboardData.getData("text");
    if (!/^[0-9a-zA-Z]{6}$/.test(token)) {
      return;
    }
    let alphanums = token.split("");
    this.inputs.forEach((input, index) => input.value = alphanums[index]);
    this.inputs[this.inputs.length - 1].focus();
  }
  
  navigate(ev) {
    let index = this.inputs.indexOf(ev.target);
    if (/^\d$/.test(ev.key) || ev.key.length === 1 && isNaN(ev.key) || ev.key === "ArrowRight") {
      if (index < this.inputs.length - 1) {
        this.inputs[index + 1].focus();
      }
    }
    if (ev.key === "ArrowLeft" || ev.key === "Backspace") {
      if (index > 0) {
        // Jump to the previous field
        this.inputs[index - 1].focus();
      }
    }
    if (ev.key === "Home") {
      this.inputs[0].focus();
    }
    if (ev.key === "End") {
      this.inputs[this.inputs.length - 1].focus();
    }
  }
  
  authenticate(ev) {
    ev.preventDefault();
    let tokenControl = document.querySelector("input[name='passwordless[token]']");
    let token = Array.prototype.map.call(this.inputs, function(input) {
      return input.value.toUpperCase();
    }).join("");
    tokenControl.value = token;
    ev.target.submit();
  }
}
