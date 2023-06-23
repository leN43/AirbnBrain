import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"; // You need to import this to use new Typed()

export default class extends Controller {
  static values = {
    sentences: Array
  }

  connect() {
    const options = {strings: ['a Gourmet', 'a Music dealer', 'a Nerd', 'a Geek', 'a Netflix junky', 'a Jargon master', 'OK Google', 'a Sarcasm leader', 'a Brain teaser', 'a Rabbit hole guide'], typeSpeed: 100, loop: true};
    new Typed(this.element, options)
  }
}
