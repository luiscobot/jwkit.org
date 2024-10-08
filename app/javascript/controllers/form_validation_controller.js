import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form-validation"
export default class extends Controller {
  static targets = ["fieldServiceGroup", "fieldServiceReport"];

  connect() {
    if (this.hasFieldServiceGroupTarget) {
      this.controls = Array.from(
        this.fieldServiceGroupTarget.querySelectorAll("[data-control]"),
      );
    }

    if (this.hasFieldServiceReportTarget) {
      this.controls = Array.from(
        this.fieldServiceReportTarget.querySelectorAll("[data-control]"),
      );
    }
  }

  toggle(ev) {
    if (
      ev.target.closest("[data-control]").dataset.control !== "sharedInMinistry"
    ) {
      return;
    }

    this.controls
      .filter(
        (control) =>
          control.dataset.control === "bibleStudies" ||
          control.dataset.control === "hours",
      )
      .forEach((control) => {
        control.querySelector("input").toggleAttribute("disabled");

        if (!control.querySelector("input").getAttribute("disabled")) {
          control.querySelector("input").value = "";
        }
      });
  }

  validate(ev) {
    ev.preventDefault();

    this.controls.forEach((control) => {
      if (this.hasFieldServiceGroupTarget) {
        if (control.dataset.control === "number") {
          let input = control.querySelector("input");
          if (!input.value.trim()) {
            this.invalidate(input, "Ingresa un número.");
          }
        }
      }

      if (this.hasFieldServiceReportTarget) {
        if (control.dataset.control === "hours") {
          let toggle = this.controls
            .find((control) => control.dataset.control === "sharedInMinistry")
            .querySelector("input[type='checkbox']");
          if (toggle.checked) {
            let input = control.querySelector("input");
            if (!input.value.trim()) {
              this.invalidate(input, "No puede estar vacío.");
            }
          }
        }
      }
    });

    if (
      this.hasFieldServiceGroupTarget &&
      !this.fieldServiceGroupTarget.dataset.formValidationError
    ) {
      this.commit();
    }

    if (
      this.hasFieldServiceReportTarget &&
      !this.fieldServiceReportTarget.dataset.formValidationError
    ) {
      this.commit();
    }
  }

  invalidate(input, message) {
    if (this.hasFieldServiceGroupTarget) {
      this.fieldServiceGroupTarget.dataset.formValidationError = true;
    }

    if (this.hasFieldServiceReportTarget) {
      this.fieldServiceReportTarget.dataset.formValidationError = true;
    }

    input.classList.add("invalid");
    input.classList.remove(
      "ring-jw-san-marino/50",
      "hover:ring-jw-san-marino",
      "focus:ring-jw-san-marino",
    );
    input.insertAdjacentHTML(
      "afterend",
      `<div data-form-validation-error class="flex flex-col mt-2"><span class="font-inter font-medium text-sm text-jw-error">${message}</span></div>`,
    );
  }

  clean(ev) {
    let input = ev.target;
    let control = input.closest("[data-control]");
    let error = control.querySelector("[data-form-validation-error]");

    if (control.contains(error)) {
      if (this.hasFieldServiceGroupTarget) {
        delete this.fieldServiceGroupTarget.dataset.formValidationError;
      }

      if (this.hasFieldServiceReportTarget) {
        delete this.fieldServiceReportTarget.dataset.formValidationError;
      }

      input.classList.remove("invalid");
      input.classList.add(
        "ring-jw-san-marino/50",
        "hover:ring-jw-san-marino",
        "focus:ring-jw-san-marino",
      );
      error.remove();
    }
  }

  commit() {
    if (this.hasFieldServiceGroupTarget) {
      this.fieldServiceGroupTarget.submit();
    }

    if (this.hasFieldServiceReportTarget) {
      this.fieldServiceReportTarget.submit();
    }
  }
}
