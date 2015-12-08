'use strict'

config = ($stateProvider) ->
  states = {}

  states['phase-row'] =
    url         : '/row'
    title       : 'phase-row'
    controller  : 'PhaseRowExampleController as vm'
    templateUrl : 'views/phase-row.example.html'

  states['phase-list'] =
    url         : '/list'
    title       : 'phase-list'
    controller  : 'PhaseListExampleController as vm'
    templateUrl : 'views/phase-list.example.html'

  states['manage-phases'] =
    url         : '/'
    title       : 'manage-phases'
    controller  : 'ManagePhasesExampleController as vm'
    templateUrl : 'views/manage-phases.example.html' 

  for key, state of states
    $stateProvider.state key, state

config.$inject = ['$stateProvider']

angular.module('example').config(config).run()


