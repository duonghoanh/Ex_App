// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"
// require("jquery")
import "bootstrap"
import "./posts.js"
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery
Rails.start()
Turbolinks.start()
ActiveStorage.start()
