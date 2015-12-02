'use strict'

config = ($stateProvider) ->
  states = {}

  states['phase-row'] =
    url         : '/'
    title       : 'phase-row'
    controller  : 'PhaseRowExampleController as vm'
    templateUrl : 'views/phase-row.example.html'

  states['phase-list'] =
    url         : '/list'
    title       : 'phase-list'
    controller  : 'PhaseListExampleController as vm'
    templateUrl : 'views/phase-list.example.html'

  for key, state of states
    $stateProvider.state key, state

config.$inject = ['$stateProvider']

angular.module('example').config(config).run()


