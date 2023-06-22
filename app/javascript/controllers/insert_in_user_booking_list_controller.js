import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-user-booking-list"
export default class extends Controller {
  connect() {
      console.log(this.element);
      console.log(this.itemsTarget);
      console.log(this.formTarget)
    }
  }
