'use strict'

controller = (PhasesService) ->
  _projectId = this.projectId

  activate = ->
    getPhases()

  removePhase = (phase) ->
    {}
    # PhasesService.remove(projectId, phase).then ->
    #   getPhases()

  addPhase = (phase) ->
    {}
    # PhasesService.remove(projectId, phase).then ->
    #   getPhases()

  getPhases = ->
    {}
    # PhasesService.get(projectId).then (phases) ->
    #   vm.phases = phases

  activate()

controller.$inject = ['$scope', 'PhasesService']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseListController', controller