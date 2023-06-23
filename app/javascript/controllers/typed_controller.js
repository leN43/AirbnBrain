import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"; // You need to import this to use new Typed()

export default class extends Controller {
  static values = {
    sentences: Array
  }

  connect() {
    const options = {strings: ["a historian", "a singer", "an artist", "a scientist"], typeSpeed: 100, loop: true};
    new Typed(this.element, options)
  }
}
