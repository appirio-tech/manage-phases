'use strict'

EMPTY = {}

controller = ($scope, PhasesService, StepsAPIService) ->
  vm                  = this
  vm.deleteCandidate  = 1

  vm.nameError      = false
  vm.startDateError = false
  vm.dueDateError   = false
  vm.endDateError   = false
  vm.typeError      = false
  vm.statusError    = false

  vm.isNew = ->
    vm.newRow

  vm.isInProgress = ->
    PhasesService.isPhaseStatusInProgress(vm.phase.status)

  vm.save = ->
    if vm.isValid()
      $scope.addClick {phase: vm.phase}
      $scope.phase = EMPTY

  vm.remove = ->
    $scope.removeClick {phase: vm.phase}
    vm.deleteCandidate = if vm.deleteCandidate == 0 then 1 else 0

  vm.validateField = (field) ->
    foundErrors = false
    fieldError  = "#{field}Error"

    if vm.phase[field]?.length
      vm[fieldError] = false
    else
      vm[fieldError] = true
      foundErrors = true

  vm.isValid = ->
    vm.validateField('name')

    foundErrors = false

    if vm.nameError || vm.startDateError || vm.dueDateError || vm.endDateError || vm.typeError || vm.statusError
      foundErrors = true

    !foundErrors

  activate = ->
    $scope.$watch 'phase', (newPhase) ->
      vm.phase    = if newPhase == undefined || newPhase == EMPTY then {} else newPhase
      vm.newRow   = if newPhase == undefined || newPhase == EMPTY then true else false
      vm.types    = angular.merge {}, PhasesService.getTypes(vm.newRow)
      vm.statuses = angular.merge {}, PhasesService.getStatuses(vm.newRow)
      if vm.newRow
        vm.phase.status = -1
        vm.phase.type = -1

    vm

  activate()

controller.$inject = ['$scope', 'PhasesService', 'StepsAPIService']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseRowController', controller
