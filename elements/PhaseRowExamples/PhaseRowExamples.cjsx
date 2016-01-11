'use strict'

React    = require 'react'
PhaseRow = require '../PhaseRow/PhaseRow.cjsx'

phase1 =
  name     : 'batman'
  startDate: '2015-12-01'
  endDate  : '2015-12-01'
  dueDate  : '2015-12-01'
  type     : 'PROJECT_LAUNCHED'
  status   : 'OPEN'

phase2 =
  name     : 'batman'
  startDate: '2015-12-01'
  endDate  : '2015-12-01'
  dueDate  : '2015-12-01'
  type     : 'PROJECT_LAUNCHED'
  status   : 'OPEN'

component = ->
  <div className="PhaseRowExample">
    <h1>Example with state edit</h1>

    <PhaseRow data={phase1} state="edit" />

    <h1> Example with no data or state</h1>

    <PhaseRow/>
  </div>


module.exports = component