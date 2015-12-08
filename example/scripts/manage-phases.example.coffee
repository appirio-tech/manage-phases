'use strict'

controller = ->
  vm = this
  vm.phases = []

  activate = ->
    for i in [0..5]
      vm.phases.push
        name     : 'robin ' + i
        startDate: '2015-12-01'
        endDate  : '2015-12-01'
        dueDate  : '2015-12-01'
        type     : 'a'
        status   : 'b'

    vm

  activate()

controller.$inject = []

angular.module('example').controller 'ManagePhasesExampleController', controller
