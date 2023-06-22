import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    const BookingValue = this.element.dataset.date.split(',').map(dateStr => new Date(dateStr));
    console.log(BookingValue)
    flatpickr(this.element, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      disable: BookingValue

    })
  }
}
