'use strict'

directive = ->
  restrict    : 'E'
  controller  : 'ManagePhasesController as vm'
  templateUrl : 'views/manage-phases.directive.html'
  scope:
    phases: '='

angular.module('appirio-tech-ng-manage-phases').directive 'managePhases', directive
