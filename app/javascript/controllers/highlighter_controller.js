import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="highlighter"
export default class extends Controller {
  static targets = ['body']

  connect () {
    this.bodyTarget.querySelectorAll('pre').forEach(function(preElement) {
      const regex = /(?!lang\-\\w\*)lang-\w*\W*/gm;
      const codeElement = document.createElement('code');
      if (preElement.childNodes.length > 1) {
        console.error('<pre> element contained nested inline elements (probably styling) and could not be processed. Please remove them and try again.')
      }
      let preElementTextNode = preElement.removeChild(preElement.firstChild);
      let language = preElementTextNode.textContent.match(regex);
      if (language) {
        language = language[0].toString().trim();
        preElementTextNode.textContent = preElementTextNode.textContent.replace(language, '');
        codeElement.classList.add(language, 'line-numbers');
      }
      codeElement.append(preElementTextNode)
      preElement.append(codeElement)
      Prism.highlightAll();
    })
  }
}
