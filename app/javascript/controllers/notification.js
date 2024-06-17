// import Notification from '@stimulus-components/notification'

// export default class extends Notification {
//     connect() {
//       super.connect()
//       console.log('Do what you want here.')
//       this.show();
//       this.timeout = setTimeout(() => {
//           this.hide();
//         }, this.delayValue || 300)
        
//     }

//     show() {
//         this.element.classList.add('show')
//         this.element.classList.remove('hide')
//     }
    
//     hide() {
//         this.element.classList.add('hide')
//         this.element.classList.remove('show')
        
//         setTimeout(() => {
//             this.element.remove();
//         }, 1000); 
//     }

//   }