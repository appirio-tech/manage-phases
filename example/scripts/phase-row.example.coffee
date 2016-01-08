'use strict'

controller = ->
  vm = this

  activate = ->
    vm.phase =
      name     : 'batman'
      startDate: '2015-12-01'
      endDate  : '2015-12-01'
      dueDate  : '2015-12-01'
      type     : 'PROJECT_LAUNCHED'
      status   : 'OPEN'

    vm.phaseInactive =
      name     : 'batman'
      startDate: '2015-12-01'
      endDate  : '2015-12-01'
      dueDate  : '2015-12-01'
      type     : 'PROJECT_LAUNCHED'
      status   : 'OPEN'

    vm.state = 'edit'

    vm

  vm.removeClick = ->
    vm.phase = {}

  activate()

controller.$inject = []

angular.module('example').controller 'PhaseRowExampleController', controller
