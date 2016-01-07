'use strict'

PhasesService = (StepsAPIService) ->
  phases = []

  getTypes = -> 
    [
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

  getStatuses = -> 
    [
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

  isPhaseStatusInProgress = (status) ->
    status == 'OPEN' || status == 'CLOSED'

  get = (projectId) ->
    #phases

    params = 
      projectId: projectId

    StepsAPIService.query(params).$promise
      

  addPhase = (projectId, phase) ->
    phases.push phase    

    # params =
    #   projectId: projectId
    #   stepId   : stepId

    # StepsAPIService.save(params, phase).$promise

  updatePhase = (projectId, phase) ->
    phases = phases.filter (x) -> x.id != phase.id
    phases.push phase

    # params =
    #   projectId: projectId
    #   stepId   : stepId

    # StepsAPIService.patch(params, phase).$promise

  removePhase = (projectId, phase) ->
    phases = phases.filter (x) -> x.id != phase.id
    # params =
    #   projectId: projectId
    #   stepId   : stepId

    # StepsAPIService.remove(params).$promise

  getTypes    : getTypes
  getStatuses : getStatuses
  isPhaseStatusInProgress : isPhaseStatusInProgress
  get                     : get
  addPhase                : addPhase
  removePhase             : removePhase
  updatePhase             : updatePhase


PhasesService.$inject = ['StepsAPIService']

angular.module('appirio-tech-ng-manage-phases').factory 'PhasesService', PhasesService