// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import RailsNestedForm from '@stimulus-components/rails-nested-form'
application.register("nested-form", RailsNestedForm);

import ImagePreviewController from './image_preview_controller'
application.register("image-preview", ImagePreviewController)

import Notification from '@stimulus-components/notification'
application.register('notification', Notification)

import PasswordVisibility from "stimulus-password-visibility";
application.register("password-visibility", PasswordVisibility);

import DaterangepickerController from "./daterangepicker_controller"
application.register("daterangepicker", DaterangepickerController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)


// import SwiperController from "./swiper_controller"
// application.register("swiper", SwiperController)

import TestController from "./test_controller"
application.register("test", TestController)
