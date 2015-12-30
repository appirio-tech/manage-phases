'use strict'

controller = ->
  vm = this
  vm.phases = []

  activate = ->
    for i in [0..3]
      vm.phases.push
        name     : 'batman ' + i
        startDate: '2015-12-01'
        endDate  : '2015-12-01'
        dueDate  : '2015-12-01'
        type     : 1
        status   : 2

    vm

  activate()

controller.$inject = []

angular.module('example').controller 'PhaseListExampleController', controller
