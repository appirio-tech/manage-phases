'use strict'

controller = ->
  vm = this

  activate = ->
    vm.phase =
      name     : 'batman'
      startDate: '2015-12-01'
      endDate  : '2015-12-01'
      dueDate: '2015-12-01'
      type     : 1
      status   : 0

    vm.phaseInactive =
      name     : 'batman'
      startDate: '2015-12-01'
      endDate  : '2015-12-01'
      dueDate: '2015-12-01'
      type     : 1
      status   : 1      

    vm

  vm.removeClick = ->
    vm.phase = {}

  activate()

controller.$inject = []

angular.module('example').controller 'PhaseRowExampleController', controller
