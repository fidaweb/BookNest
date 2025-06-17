// my-card.js
export class MyNavbar extends HTMLElement{
    constructor() {
      super();
      this.attachShadow({ mode: 'open' });
    }
  
    async connectedCallback() {
      // Load the external HTML template
      const response = await fetch('../components/navbar.html');
      const text = await response.text();
  
      // Parse the HTML and extract the template
      const parser = new DOMParser();
      const doc = parser.parseFromString(text, 'text/html');
      const template = doc.getElementById('navbar-template')
  
      // Clone and attach the template content to shadow DOM
      if (template) {
        const clone = template.content.cloneNode(true);
        this.shadowRoot.appendChild(clone);
      }
    }
  }
  
  // Register the custom element
  customElements.define('my-navbar', MyNavbar)
  