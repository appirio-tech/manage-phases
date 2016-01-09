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
    <PhaseRow data={phase1} state="edit" />

    <PhaseRow data={phase2} state=null />
  </div>


module.exports = component