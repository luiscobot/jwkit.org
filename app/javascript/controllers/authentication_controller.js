import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="authentication"
export default class extends Controller {
  static targets = ["email", "otp"];

  connect() {
    if (this.hasOtpTarget) {
      this.inputs = Array.from(this.otpTarget.querySelectorAll("[data-control='otp']"));
    }

    if (this.hasEmailTarget) {
      this.input = this.emailTarget.querySelector("[data-control='email']");
    }
  }

  validate(ev) {
    if (this.hasOtpTarget) {
      if (!/^[0-9a-zA-Z]{1}$/.test(ev.key) && ev.key !== "Tab" && ev.key !== "Backspace" && ev.key !== "Delete" && ev.key !== "Enter") {
        ev.preventDefault();
      }
    }

    if (this.hasEmailTarget) {
      let error = this.emailTarget.querySelector("[data-authentication-error]");

      if (!this.input.value.trim()) {
        this.input.focus();
        !this.emailTarget.contains(error) && this.invalidate("Ingresa un correo electrónico para iniciar sesión.");
      } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.input.value)) {
        this.input.focus();
        !this.emailTarget.contains(error) && this.invalidate("El correo electrónico no es válido.");
      } else {
        return true;
      }
    }
  }

  invalidate(message) {
    this.input.classList.add("invalid");
    this.input.classList.remove("ring-jw-bokara-gray", "hover:ring-jw-san-marino", "focus:ring-jw-san-marino");
    this.input.insertAdjacentHTML("afterend", `<div data-authentication-error class="flex flex-col mt-2"><span class="font-inter font-medium text-sm text-jw-error">${message}</span></div>`);
  }

  clean() {
    let error = this.emailTarget.querySelector("[data-authentication-error]");

    if (this.emailTarget.contains(error)) {
      this.input.classList.remove("invalid");
      this.input.classList.add("ring-jw-bokara-gray", "hover:ring-jw-san-marino", "focus:ring-jw-san-marino");
      error.remove();
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
    this.authenticate();
  }
  
  navigate(ev) {
    let index = this.inputs.indexOf(ev.target);
    if (/^[0-9a-zA-Z]{1}$/.test(ev.key) || ev.key === "ArrowRight") {
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
  
  buildToken() {
    let tokenControl = document.querySelector("input[name='passwordless[token]']");
    let token = Array.prototype.map.call(this.inputs, function(input) {
      return input.value.toUpperCase();
    }).join("");
    tokenControl.value = token;
  }

  authenticate(ev) {
    ev && ev.preventDefault();

    if (this.hasOtpTarget) {
      this.buildToken();
      this.otpTarget.closest("form").submit();
    }

    if (this.hasEmailTarget) {
      this.validate() && ev.target.submit();
    }
  }
}
