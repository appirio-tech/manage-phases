'use strict'

PhasesService = (StepsAPIService) ->
  getTypes = (includePlaceholder) -> 
    placeHolder = if includePlaceholder
      [
        label: 'Phase Type'
        value: -1
      ]
    else
      []

    placeHolder.concat [
      label: 'Project Submitted'
      value: 0
    ,
      label: 'Project Launched'
      value: 1
    ]

  getStatuses = (includePlaceholder) -> 
    placeHolder = if includePlaceholder
      [
        label: 'Status'
        value: -1
      ]
    else
      []

    placeHolder.concat [
    	label: 'Scheduled'
    	value: 0
    ,
    	label: 'In Progress'
    	value: 1
    ,
    	label: 'Closed'
    	value: 2
    ]

  isPhaseStatusInProgress = (status) ->
    status > 0

  addPhase = (projectId, phase) ->
    params =
      projectId: projectId
      stepId   : stepId

    StepsAPIService.save(params, phase).$promise

  updatePhase = (projectId, phase) ->
    params =
      projectId: projectId
      stepId   : stepId

    StepsAPIService.patch(params, phase).$promise

  removePhase = (projectId, phase) ->
    params =
      projectId: projectId
      stepId   : stepId

    StepsAPIService.remove(params).$promise

  getTypes    : getTypes
  getStatuses : getStatuses
  isPhaseStatusInProgress : isPhaseStatusInProgress


PhasesService.$inject = ['StepsAPIService']

angular.module('appirio-tech-ng-manage-phases').factory 'PhasesService', PhasesService