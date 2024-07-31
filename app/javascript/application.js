// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
// import Swiper JS
// import Swiper from 'swiper';
// import Swiper styles
// import 'swiper/css';

// Import jQuery and Moment.js
import $ from 'jquery'
import moment from 'moment'
window.$ = $
window.jQuery = $

// Import Date Range Picker and its CSS
import 'daterangepicker'
import 'daterangepicker/daterangepicker.css'

import "trix"
import "@rails/actiontext"
