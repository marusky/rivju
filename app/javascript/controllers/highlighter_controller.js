import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="highlighter"
export default class extends Controller {
  static targets = [ "code", "comment" ]

  connect (event) {
    hljs.highlightAll()
    hljs.initLineNumbersOnLoad();



    setTimeout(() => {
      this.codeTargets.forEach((codeTarget) => {
        if (codeTarget.firstChild.tagName === undefined ) {
          console.log('mame tu iba jednoriadkove daco')
        } else {
          const tableRows = codeTarget.firstChild.firstChild.childNodes

          const comments = this.commentTargets.map((comment) => {
            return [parseInt(comment.dataset.fromLine), parseInt(comment.dataset.toLine)]
          })

          tableRows.forEach((tr) => {
            tr.addEventListener('click', () => this.chooseRow(tr))

            comments.forEach((fromTo) => {
              const [ fromLine, toLine ] = fromTo

              if ( fromLine <= tr.firstChild.dataset.lineNumber && tr.firstChild.dataset.lineNumber <= toLine) {
                tr.classList.add('code-with-comment')
              }
            })
          })
        }
      })
    }, 300)
  }

  chooseRow (tr) {
    tr.style.backgroundColor = '#222444'
    setTimeout(() => tr.style.backgroundColor = 'inherit', 300)
  }

  emphasizeComment
}
