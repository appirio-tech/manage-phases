'use strict'

React    = require 'react'
StepRow = require './StepRow.coffee'

Step1 =
  name     : 'batman'
  startDate: '2015-12-01'
  endDate  : '2015-12-01'
  dueDate  : '2015-12-01'
  type     : 'PROJECT_LAUNCHED'
  status   : 'OPEN'

Step2 =
  name     : 'batman'
  startDate: '2015-12-01'
  endDate  : '2015-12-01'
  dueDate  : '2015-12-01'
  type     : 'PROJECT_LAUNCHED'
  status   : 'OPEN'

component = ->
  <div className="StepRowExample">
    <h1>Example with state edit</h1>

    <StepRow projectId="abc" state="edit" />

    <h1> Example with no data or state</h1>

    <StepRow/>
  </div>


module.exports = component