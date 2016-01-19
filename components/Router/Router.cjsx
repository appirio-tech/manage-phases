'use strict'

React                = require 'react'
ExampleApp           = require '../ExampleApp/ExampleApp.cjsx'
Router               = require '../Router/Router.cjsx'
ManageStepsExamples = require '../ManageSteps/ManageStepsExamples.cjsx'
StepRowExamples     = require '../StepRow/StepRowExamples.cjsx'
history              = require('history/lib/createBrowserHistory')()


{ Router, Route, IndexRoute } = require 'react-router'

component = ->
  <Router history={history}>
    <Route path="/" component={ExampleApp}>
      <IndexRoute component={ManageStepsExamples}/>

      <Route path="StepRowExamples" component={StepRowExamples} />
    </Route>
  </Router>

module.exports = component