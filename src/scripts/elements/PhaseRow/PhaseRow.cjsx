'use strict'

require './PhaseRow.scss'
require 'react-datetime/css/react-datetime.css'

React    = require 'react'
DateTime = require 'react-datetime'
Select   = require 'react-select'

types = [
  label: 'Project Submitted'
  value: 'projectSubmitted'
  id   : 1
,
  label: 'Project Launched'
  value: 'projectLaunched'
  id   : 2
,
  label: 'Design Concepts'
  value: 'designConcepts'
  id   : 3
,
  label: 'Final Designs'
  value: 'completeDesigns'
  id   : 4
,
  label: 'Final Fixes'
  value: 'finalFixes'
  id   : 5
,
  label: 'Development'
  value: 'code'
  id   : 6
]

statuses = [
  label: 'Scheduled'
  value: 'SCHEDULED'
  id   : 1
,
  label: 'In Progress'
  value: 'OPEN'
  id   : 2
,
  label: 'Closed'
  value: 'CLOSED'
  id   : 3
]

component = ({data}) ->
  loader = <loader />
  loader = null

  <form className="PhaseRow flex middle">
    { loader }

    <input className="name" value={data.name} />

    <DateTime />

    <Select
      options={types}
      clearable=false
      placeholder="Phase Type"
      value={data.stepType}
    />

    <Select
      options={statuses}
      clearable=false
      placeholder="Status"
      value={data.stepStatus}
    />

    <button className="clean">
      <div className="icon plus hollow" />
    </button>
  </form>

component.propTypes =
  data: React.PropTypes.object

module.exports = component
