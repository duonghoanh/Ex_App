
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery
const { environment } = require('@rails/webpacker')

const webpack = require('webpack');
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
  })
)

module.exports = environment
