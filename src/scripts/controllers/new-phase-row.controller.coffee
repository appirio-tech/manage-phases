'use strict'

controller = ($scope, PhasesService, StepsAPIService) ->
  vm            = this
  vm.types      = angular.merge [], PhasesService.getTypes(true)
  vm.statuses   = angular.merge [], PhasesService.getStatuses(true)

  activate = ->
    vm

  reset = ->
    vm.phase = {}

    vm.phase.name       = ""
    vm.phase.status     = ''
    vm.phase.stepType       = ''

    vm.nameError      = false
    vm.startDateError = false
    vm.dueDateError   = false
    vm.endDateError   = false
    vm.typeError      = false
    vm.statusError    = false

  vm.save = ->
    if vm.isValid()
      vm.saveRow({phase: vm.phase})
      reset()

  vm.onTypeChange = (changeTo) ->
    vm.phase.type = changeTo
    #vm.types = PhasesService.getTypes(false) if vm.phase.type >= 0 
    vm.validateField('type', 'dropdown')

  vm.onStatusChange = (changeTo) ->
    vm.phase.status = changeTo
    #vm.statuses     = PhasesService.getTypes(false) if vm.phase.status >= 0
    vm.validateField('status', 'dropdown')

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

  reset()
  activate()

controller.$inject = ['$scope', 'PhasesService', 'StepsAPIService']

angular.module('appirio-tech-ng-manage-phases').controller 'NewPhaseRowController', controller
