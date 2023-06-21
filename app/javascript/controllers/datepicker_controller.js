import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = { toggle: Array}
  connect() {
    flatpickr(this.element, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      // disable: [
      //   date=> {
      //     const formatted = date.toISOString().slice(0, 10)
      //     return this.toggleValues.includes(formatted)
      //   }
      // ],
      // enable: [
      //   date=> {
      //     const formatted = date.toISOString().slice(0, 10)
      //     return !this.toggleValues.includes(formatted)
      //   }
      // ]
    })
  }
}
