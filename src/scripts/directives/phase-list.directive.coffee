'use strict'

directive = ->
  restrict    : 'E'
  controller  : 'PhaseListController'
  controllerAs: 'phaseListCtrl'
  templateUrl : 'views/phase-list.directive.html'
  bindToController: true
  scope:
    projectId: '@'
    phases:    '='

angular.module('appirio-tech-ng-manage-phases').directive 'phaseList', directive
