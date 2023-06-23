import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()








export default class extends Controller {
  static targets = [ "input", "open"]
  static values = { date: Array, brain: Number, user: Number, status: String}
  connect() {
    console.log(this.dateValue, this.brainValue, this.userValue, this.statusValue)
    flatpickr(this.element, {
      altInput: false,
      appendTo: window.document.querySelector('#mydate'),
      mode: "range",
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      clickOpens: true,
      disable: this.dateValue,
      onClose: (selectedDates) => {
        const dates = selectedDates.map(date => date.toLocaleDateString("en-GB"))
        this.inputTarget.textContent = "Booking from " + dates.join(" to ") + " ?";
        const el = document.createElement("button");
        el.type = "submit";
        el.className = "btn btn-primary";
        el.textContent = "Book";
        this.inputTarget.appendChild(el);
        el.addEventListener("click", () => {
          this.createbooking(dates[0], dates[dates.length - 1], this.userValue, this.brainValue, "Pending");
        });
      },
    });
  }

    createbooking(start_date, end_date, user, brain, status) {
        const url = `/brains/id:${brain}/bookings`;
        console.log(start_date, end_date, user, brain , status)
        fetch(url, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ start_date: start_date, end_date: end_date, user_id: user, brain_id: brain, status: status }),
        })
          .then(response => console.log(response))
          .then((data) => {
            console.log(data);
          }
        );
    };
}
