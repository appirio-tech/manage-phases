'use strict'

directive = ->
  restrict    : 'E'
  scope: {}
  controller  : 'NewPhaseRowController as vm'
  templateUrl : 'views/new-phase-row.directive.html'
  bindToController: 
    addClick: '&'

angular.module('appirio-tech-ng-manage-phases').directive 'newPhaseRow', directive
