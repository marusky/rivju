import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="highlighter"
export default class extends Controller {
  static targets = [ "code" ]

  connect (event) {
    hljs.highlightAll()
    hljs.initLineNumbersOnLoad();

    setTimeout(() => {
      const tableRows = this.codeTarget.firstChild.firstChild.childNodes

      tableRows.forEach((tr) => {
        tr.addEventListener('click', () => this.chooseRow(tr))
      })
    }, 300)
  }

  chooseRow (tr) {
    console.log(tr)
    tr.style.backgroundColor = '#222444'
    setTimeout(() => tr.style.backgroundColor = 'inherit', 300)
  }
}
