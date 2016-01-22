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
    { loadProject, loadStepsByProject, projectId } = this.props

    loadProject projectId
    loadStepsByProject projectId

  render: ->
    React.createElement ManageStepsView, this.props

mapStateToProps = (state, ownProps) ->
  id = ownProps.projectId

  projectId: id
  stepIds: state.stepsByProject[id]?.items || []
  fetching: state.stepsByProject[id]?.isFetching

actionsToBind = {
  loadProject
  loadStepsByProject
}

module.exports = connect(mapStateToProps, actionsToBind)(ManageSteps)
