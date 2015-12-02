'use strict'

controller = ($scope) ->
  vm          = this
  vm.loading  = false

  vm.save = ->
    vm.loading = true

  activate = ->
    vm

  activate()

controller.$inject = ['$scope']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseRowController', controller
