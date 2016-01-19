'use strict'

require './ManageSteps.scss'

React      = require 'react'
classNames = require 'classnames'
StepRow   = require '../StepRow/StepRow.cjsx'

component = ({data, state}) ->
  <div className="ManageSteps">
    <div className="add-a-Step">
      <h5>add a Step</h5>

      <hr  />

      <StepRow />
    </div>

    <div className="project-Steps">
      <header className="flex space-between middle">
        <h5>project Steps</h5>

        <button className="action">Update</button>
      </header>

      <hr  />

      {
        headers = ['Step Name', 'Start Date', 'Due Date', 'End Date', 'Step Type', 'Step Status']

        if data?.Steps?.length
          <div>
            <ul className="column-headers flex center">
              {
                headers.map (item) ->
                  <li>{item}</li>
              }
            </ul>

            <ul className="Steps">
              {
                data?.Steps?.map (Step) ->
                  <li>
                    <StepRow data={Step} state="edit" />
                  </li>
              }
            </ul>
          </div>
        else
          <p>Add Steps above to layout your project schedule.</p>
      }
    </div>
  </div>

component.propTypes =
  data : React.PropTypes.object

module.exports = component