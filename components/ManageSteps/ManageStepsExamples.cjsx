'use strict'

require './ManageStepsExamples.scss'

React        = require 'react'
ManageSteps = require './ManageSteps.cjsx'

Steps = [
  name     : 'batman'
  startDate: '2015-12-01'
  endDate  : '2015-12-01'
  dueDate  : '2015-12-01'
  type     : 'PROJECT_LAUNCHED'
  status   : 'OPEN'
,
  name     : 'batman'
  startDate: '2015-12-01'
  endDate  : '2015-12-01'
  dueDate  : '2015-12-01'
  type     : 'PROJECT_LAUNCHED'
  status   : 'OPEN'
,
  name     : 'batman'
  startDate: '2015-12-01'
  endDate  : '2015-12-01'
  dueDate  : '2015-12-01'
  type     : 'PROJECT_LAUNCHED'
  status   : 'OPEN'
]

component = ->
  <div className="ManageStepsExamples light-bg">
    <h1>Example with data</h1>

    <ManageSteps data={Steps: Steps} />

    <h1>Example with no data</h1>

    <ManageSteps />
  </div>


module.exports = component