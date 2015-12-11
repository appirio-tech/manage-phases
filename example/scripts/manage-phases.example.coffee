'use strict'

controller = ->
  vm = this
  vm.phases = []

  activate = ->
    for i in [0..2]
      vm.phases.push
        name     : 'robin ' + i
        startDate: '2015-12-01'
        endDate  : '2015-12-01'
        dueDate  : '2015-12-01'
        type     : 1
        status   : 2

    vm

  activate()

controller.$inject = []

angular.module('example').controller 'ManagePhasesExampleController', controller
