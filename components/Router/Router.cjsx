'use strict'

React                = require 'react'
ExampleApp           = require '../ExampleApp/ExampleApp.cjsx'
Router               = require '../Router/Router.cjsx'
ManagePhasesExamples = require '../ManagePhases/ManagePhasesExamples.cjsx'
PhaseRowExamples     = require '../PhaseRow/PhaseRowExamples.cjsx'
history              = require('history/lib/createBrowserHistory')()


{ Router, Route, IndexRoute } = require 'react-router'

component = ->
  <Router history={history}>
    <Route path="/" component={ExampleApp}>
      <IndexRoute component={ManagePhasesExamples}/>

      <Route path="PhaseRowExamples" component={PhaseRowExamples} />
    </Route>
  </Router>

module.exports = component