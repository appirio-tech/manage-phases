'use strict'

React               = require 'react'
Provider            = require('react-redux').Provider
ExampleApp          = require '../ExampleApp/ExampleApp.cjsx'
Router              = require '../Router/Router.cjsx'
ManageStepsExamples = require '../ManageSteps/ManageStepsExamples.cjsx'
StepRowExamples     = require '../StepRow/StepRowExamples.cjsx'
history             = require('history/lib/createBrowserHistory')()
store               = require('appirio-tech-client-app-layer').default()


{ Router, Route, IndexRoute } = require 'react-router'

component = ->
  <Provider store={store}>
    <Router history={history}>
      <Route path="/" component={ExampleApp}>
        <IndexRoute component={ManageStepsExamples}/>

        <Route path="StepRowExamples" component={StepRowExamples} />
      </Route>
    </Router>
  </Provider>

module.exports = component