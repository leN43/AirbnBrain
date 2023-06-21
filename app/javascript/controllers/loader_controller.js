import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="data-booking-loader"
export default class extends Controller {
  static values = { url: String }

  connect() {
    console.log(this.urlValue)
    fetch(this.urlValue, {
      headers: { accept: "application/json" }
    })
    .then(response => response.json())
    .then((data) => {
      console.log(this.urlValue);
    });
  }
}
