import { Controller } from "@hotwired/stimulus"
import hljs from 'highlight.js'

// Connects to data-controller="highlighter"
export default class extends Controller {
  static targets = [ "code" ]

  connect (event) {
    hljs.highlightAll()

    console.log(this.codeTarget.firstChild.offsetHeight/12)
  }
}
