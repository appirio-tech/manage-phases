'use strict'

controller = (PhasesService, StepsAPIService) ->
  vm            = this
  vm.phase      = vm.phase()
  vm.types      = angular.merge [], PhasesService.getTypes(false)
  vm.statuses   = angular.merge [], PhasesService.getStatuses(false)

  #vm.deleteCandidate  = 1

  vm.nameError      = false
  vm.startDateError = false
  vm.dueDateError   = false
  vm.endDateError   = false
  vm.typeError      = false
  vm.statusError    = false

  activate = ->
    vm

  vm.onTypeChange = (changeTo) ->
    vm.phase.type = changeTo
    vm.validateField('type', 'dropdown')

  vm.onStatusChange = (changeTo) ->
    vm.phase.status = changeTo
    vm.validateField('status', 'dropdown')

  vm.isInProgress = ->
    PhasesService.isPhaseStatusInProgress(vm.phase.status)

  vm.remove = ->
    vm.removeClick({phase: vm.phase})
    vm.deleteCandidate = if vm.deleteCandidate == 0 then 1 else 0

  vm.validateField = (field, type) ->
    foundErrors = false
    fieldError  = "#{field}Error"

    if type == 'dropdown'
      if vm.phase[field] >= 0
        vm[fieldError] = false
      else
        vm[fieldError] = true
        foundError = true
    else
      if vm.phase[field]?.length
        vm[fieldError] = false
      else
        vm[fieldError] = true
        foundErrors = true

  vm.isValid = ->
    vm.validateField('name')
    vm.validateField('type', 'dropdown')
    vm.validateField('status', 'dropdown')

    foundErrors = false

    if vm.nameError || vm.startDateError || vm.dueDateError || vm.endDateError || vm.typeError || vm.statusError
      foundErrors = true

    !foundErrors

  activate()

controller.$inject = ['PhasesService', 'StepsAPIService']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseRowController', controller
