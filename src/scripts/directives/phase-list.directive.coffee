'use strict'

directive = ->
  restrict    : 'E'
  scope       : {}
  controller  : 'PhaseListController as vm'
  templateUrl : 'views/phase-list.directive.html'
  bindToController: 
    projectId: '@'
    phases:    '='

angular.module('appirio-tech-ng-manage-phases').directive 'phaseList', directive
