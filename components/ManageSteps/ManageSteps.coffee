'use strict'

React                  = require 'react'
ManageStepsView        = require './ManageStepsView'
{ connect }            = require 'react-redux'
{ loadProject,
  loadStepsByProject } = require 'appirio-tech-client-app-layer'

ManageSteps = React.createClass
  propTypes:
    projectId: React.PropTypes.string.isRequired

  componentWillMount: ->
    this.props.loadProject this.props.projectId
    this.props.loadStepsByProject this.props.projectId

  render: ->
    React.createElement ManageStepsView

mapStateToProps = (state, ownProps) ->
  id    = ownProps.projectId
  steps = state.stepsByProject[id]?.items?.map (stepId) ->
    state.entities.steps[stepId]

  project: state.entities.projects[id]
  steps: steps || []

actionsToBind = {
  loadProject
  loadStepsByProject
}

module.exports = connect(mapStateToProps, actionsToBind)(ManageSteps)
