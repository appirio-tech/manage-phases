'use strict'

require './ManagePhases.scss'

React      = require 'react'
classNames = require 'classnames'
PhaseRow   = require '../PhaseRow/PhaseRow.cjsx'

component = ({data, state}) ->
  <div className="ManagePhases">
    <div className="add-a-phase">
      <h5>add a phase</h5>

      <hr  />

      <PhaseRow />
    </div>

    <div className="project-phases">
      <header className="flex space-between middle">
        <h5>project phases</h5>

        <button className="action">Update</button>
      </header>

      <hr  />

      {
        headers = ['Phase Name', 'Start Date', 'Due Date', 'End Date', 'Phase Type', 'Phase Status']

        if data?.phases?.length
          <div>
            <ul className="column-headers flex center">
              {
                headers.map (item) ->
                  <li>{item}</li>
              }
            </ul>

            <ul className="phases">
              {
                data?.phases?.map (phase) ->
                  <li>
                    <PhaseRow data={phase} state="edit" />
                  </li>
              }
            </ul>
          </div>
        else
          <p>Add Phases above to layout your project schedule.</p>
      }
    </div>
  </div>

component.propTypes =
  data : React.PropTypes.object

module.exports = component