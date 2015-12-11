'use strict'

controller = ($scope) ->
  vm        = this
  vm.phases = $scope.phases

  vm.addPhase = (phase) ->
    vm.phases.push angular.copy phase

  activate = ->

    vm

  activate()

controller.$inject = ['$scope']

angular.module('appirio-tech-ng-manage-phases').controller 'ManagePhasesController', controller
