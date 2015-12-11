'use strict'

controller = ($scope) ->
  vm          = this
  vm.phases   = $scope.phases

  vm.removePhase = (phase) ->
    $scope.phases = vm.phases.filter (x) -> x != phase

  activate = ->
  	$scope.$watch 'phases', (newValue) ->
      vm.phases = newValue

    vm

  activate()

controller.$inject = ['$scope']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseListController', controller