'use strict'

require './PhaseRow.scss'
require 'react-datetime/css/react-datetime.css'

React      = require 'react'
DateTime   = require 'react-datetime'
Select     = require 'react-select'
classNames = require 'classnames'

types = [
  label: 'Project Submitted'
  value: 'PROJECT_SUBMITTED'
,
  label: 'Project Launched'
  value: 'PROJECT_LAUNCHED'
,
  label: 'Design Concepts'
  value: 'DESIGN_CONCEPTS'
,
  label: 'Final Designs'
  value: 'FINAL_DESIGNS'
,
  label: 'Final Fixes'
  value: 'FINAL_FIXES'
,
  label: 'Development'
  value: 'DEVELOPMENT'
]

statuses = [
  label: 'Scheduled'
  value: 'SCHEDULED'
,
  label: 'In Progress'
  value: 'OPEN'
,
  label: 'Closed'
  value: 'CLOSED'
]

component = ({data, state}) ->
  loader = <loader />
  loader = ''
  showPicker = null

  submitClassNames = classNames
    'icon'  : true
    'hollow': true
    'plus'  : state != 'edit'
    'minus' : state == 'edit'

  phaseType = <Select
    className   = "types"
    options     = {types}
    clearable   = false
    placeholder = "Phase Type"
    value       = {data.type}
  />

  if state == 'edit'
    phaseType = <p className="types">{data.status}</p>

  <form className="PhaseRow flex middle">
    { loader }

    <input type="text" className="name" placeholder="Name Phase" value={data.name} />

    <DateTime className="DateTime" open={showPicker} />

    {phaseType}

    <Select
      className   = "statuses"
      options     = {statuses}
      clearable   = false
      placeholder = "Status"
      value       = {data.status}
    />

    <button className="clean" type="submit">
      <div className={submitClassNames} />
    </button>
  </form>

component.propTypes =
  data : React.PropTypes.object
  state: React.PropTypes.string

module.exports = component
