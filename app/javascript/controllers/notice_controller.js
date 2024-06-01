import { Controller } from '@hotwired/stimulus'

export default class extends Controller { 
    static targets = ["noticeBox"]
    connect() {
        console.log('this is notice js controller')
    }

    closeNotice() {
        this.noticeBoxTarget.classList.add('hidden')
    }
}