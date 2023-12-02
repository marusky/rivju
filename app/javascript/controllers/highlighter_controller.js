import { Controller } from "@hotwired/stimulus"
import hljs from 'highlight.js'

// Connects to data-controller="highlighter"
export default class extends Controller {
  connect (event) {
    hljs.highlightAll()
  }
}
