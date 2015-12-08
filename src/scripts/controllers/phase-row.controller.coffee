'use strict'

controller = ($scope) ->
  vm          = this
  vm.phase    = $scope.phase
  vm.loading  = false

  vm.save     = $scope.add

  #   #vm.loading = true

  activate = ->
    vm

  activate()

controller.$inject = ['$scope']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseRowController', controller
