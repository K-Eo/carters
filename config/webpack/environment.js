const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const typescript =  require('./loaders/typescript')

environment.loaders.append('typescript', typescript)

environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  jquery: 'jquery'
}))

module.exports = environment
