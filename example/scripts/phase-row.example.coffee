'use strict'

controller = ->
  vm = this

  activate = ->
    vm.phase =
      name     : 'batman'
      startDate: '2015-12-01'
      endDate  : '2015-12-01'
      startDate: '2015-12-01'
      type     : 'a'
      status   : 'b'

    vm

  activate()

controller.$inject = []

angular.module('example').controller 'PhaseRowExampleController', controller
