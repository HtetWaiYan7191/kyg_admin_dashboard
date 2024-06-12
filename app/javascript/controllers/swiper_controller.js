// app/javascript/controllers/swiper_controller.js
import { Controller } from '@hotwired/stimulus';
import Swiper, { Navigation, Pagination } from 'swiper';
import 'swiper/swiper-bundle.css';
Swiper.use([Navigation, Pagination]);

export default class extends Controller {
  connect() {
    console.log('connecting swiper')
    this.swiper = new Swiper('.swiper-container', {
      // Swiper configuration options
      pagination: {
        el: ".swiper-pagination",
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
}