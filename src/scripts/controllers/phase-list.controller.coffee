'use strict'

controller = (PhasesService) ->
  vm = this
  vm.phases = [] #vm.phases
  _projectId = this.projectId

  activate = ->
    getPhases()

    vm

  vm.removePhase = (phase) ->
    PhasesService.removePhase(_projectId, phase)

    vm.phases = PhasesService.get(_projectId)
    # PhasesService.remove(projectId, phase).then ->
    #   getPhases()

  saveRow = (phase) ->
    PhasesService.update(_projectId, phase)

    vm.phases = PhasesService.get(_projectId)
    # PhasesService.remove(projectId, phase).then ->
    #   getPhases()

  getPhases = ->
    PhasesService.get(_projectId).then (phases) ->
      vm.phases = phases
    # PhasesService.get(projectId).then (phases) ->
    #   vm.phases = phases

  vm.addPhase = (phase) ->
    PhasesService.addPhase(_projectId, phase)

    vm.phases = PhasesService.get(_projectId)

  activate()

controller.$inject = ['PhasesService']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseListController', controller