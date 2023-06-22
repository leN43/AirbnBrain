import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = { toggle: Array}
  connect() {
    console.log(this.toggleValue)
    flatpickr(this.element, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      disableMobile: true,
      enableTime: false

    })
  }
}
