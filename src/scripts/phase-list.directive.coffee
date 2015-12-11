'use strict'

directive = ->
  restrict    : 'E'
  controller  : 'PhaseListController as vm'
  templateUrl : 'views/phase-list.directive.html'
  scope:
    phases: '='

angular.module('appirio-tech-ng-manage-phases').directive 'phaseList', directive
