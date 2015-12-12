'use strict'

controller = ($scope, PhasesService) ->
  vm          = this
  projectId   = $scope.projectId

  activate = ->
    getPhases()

  vm.removePhase = (phase) ->
    PhasesService.remove(projectId, phase).then ->
      getPhases()

  vm.addPhase = (phase) ->
    PhasesService.remove(projectId, phase).then ->
      getPhases()

  getPhases = ->
    PhasesService.get(projectId).then (phases) ->
      vm.phases = phases

  activate()

  vm

controller.$inject = ['$scope', 'PhasesService']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseListController', controller