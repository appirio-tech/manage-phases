'use strict'

PhaseRow = require '../elements/PhaseRow/PhaseRow.cjsx'

directive = (reactDirective) ->
  reactDirective PhaseRow

directive.$inject = ['reactDirective']

angular.module('appirio-tech-ng-manage-phases').directive 'phaseRow', directive

