'use strict'

require './ManageStepsExamples.scss'

React        = require 'react'
ManageSteps = require './ManageSteps.coffee'

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

    {# <ManageSteps projectId="1435677908878-f5e91b34-9ea1-407d-b882-0022ea2de0da" /> }
    <ManageSteps projectId="1449512666581-2425e29a-d406-40cb-944b-0b3b868b6f16" />

    {# <h1>Example with no data</h1> }

    {# <ManageSteps projectId="abc" /> }
  </div>


module.exports = component