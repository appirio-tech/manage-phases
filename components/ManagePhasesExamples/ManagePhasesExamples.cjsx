'use strict'

require './ManagePhasesExamples.scss'

React        = require 'react'
ManagePhases = require '../ManagePhases/ManagePhases.cjsx'

phases = [
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
  <div className="ManagePhasesExamples light-bg">
    <h1>Example with data</h1>

    <ManagePhases data={phases: phases} />

    <h1>Example with no data</h1>

    <ManagePhases />
  </div>


module.exports = component