import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toastr"
export default class extends Controller {
  connect() {
    console.log('toast connecting')
    /* toastr [end]*/
  }
}
