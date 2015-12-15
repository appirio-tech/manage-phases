'use strict'

EMPTY = {}

controller = (newPhase, PhasesService, StepsAPIService) ->
  vm                  = this
  vm.phase            = if newPhase
  vm.types            = angular.merge {}, PhasesService.getTypes(true)
  vm.statuses         = angular.merge {}, PhasesService.getStatuses(true)
  vm.phase.status     = -1
  vm.phase.type       = -1

  vm.nameError      = false
  vm.startDateError = false
  vm.dueDateError   = false
  vm.endDateError   = false
  vm.typeError      = false
  vm.statusError    = false

  activate = ->
    vm

  vm.save = ->
    if vm.isValid()
      $scope.addClick {phase: vm.phase}
      $scope.phase = EMPTY

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

  activate()

controller.$inject = ['newPhase', 'PhasesService', 'StepsAPIService']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseRowController', controller
