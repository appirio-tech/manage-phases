'use strict'

PhasesService = ->
  getTypes = (includePlaceholder) -> 
    placeHolder = if includePlaceholder
      [
        name: 'Phase Type'
        value: -1
      ]
    else
      []

    placeHolder.concat [
      name: 'Project Submitted'
      value: 0
    ,
      name: 'Project Launched'
      value: 1
    ]

  getStatuses = (includePlaceholder) -> 
    placeHolder = if includePlaceholder
      [
        name: 'Status'
        value: -1
      ]
    else
      []

    placeHolder.concat [
    	name: 'Scheduled'
    	value: 0
    ,
    	name: 'In Progress'
    	value: 1
    ,
    	name: 'Closed'
    	value: 2
    ]

  isPhaseStatusInProgress = (status) ->
    status > 0 

  getTypes    : getTypes
  getStatuses : getStatuses
  isPhaseStatusInProgress : isPhaseStatusInProgress

PhasesService.$inject = []

angular.module('appirio-tech-ng-manage-phases').factory 'PhasesService', PhasesService