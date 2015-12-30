'use strict'

controller = ->
  vm = this

  activate = ->
    vm

  vm.inner = (phase) ->
    #alert(phase.name)
    vm.phase = phase

    vm

  activate()

controller.$inject = []

angular.module('example').controller 'NewPhaseRowExampleController', controller
