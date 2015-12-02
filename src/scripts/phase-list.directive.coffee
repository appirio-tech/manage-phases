'use strict'

directive = ->
  restrict    : 'E'
  templateUrl : 'views/phase-list.directive.html'
  scope:
    phases: '='

angular.module('appirio-tech-ng-manage-phases').directive 'phaseList', directive
