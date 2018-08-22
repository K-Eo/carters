import $ from 'jquery'
import Rails from 'rails-ujs'

import 'bootstrap/dist/js/bootstrap.bundle'

import '../src/application.scss'

import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

import '@fortawesome/fontawesome-free/css/all.css'

window.$ = $
Rails.start()

const application = Application.start()
const context = require.context('controllers', true, /.(ts|js)$/)
application.load(definitionsFromContext(context))
