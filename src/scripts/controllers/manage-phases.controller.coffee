'use strict'

controller = ($scope) ->
  vm        = this
  vm.phases = $scope.phases
  
  vm.test   = ->
    alert(1)

  activate = ->

    vm

  activate()

controller.$inject = ['$scope']

angular.module('appirio-tech-ng-manage-phases').controller 'ManagePhasesController', controller
