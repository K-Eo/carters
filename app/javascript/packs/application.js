import 'jquery'
import 'bootstrap/dist/js/bootstrap.bundle'

import '../src/application.scss'

import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

const application = Application.start()
const context = require.context('controllers', true, /.ts$/)
application.load(definitionsFromContext(context))
