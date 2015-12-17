'use strict'

controller = ->
  vm = this

  activate = ->
    {}

  vm.addRowClick = (phase) ->
    vm.phase = {}

    vm

  activate()

controller.$inject = []

angular.module('example').controller 'NewPhaseRowExampleController', controller
