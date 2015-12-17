'use strict'

controller = (PhasesService, StepsAPIService) ->
  this.types            = angular.merge [], PhasesService.getTypes(true)
  this.statuses         = angular.merge [], PhasesService.getStatuses(true)

  activate = ->
    this

  this.reset = ->
    this.phase = {}
    this.phase.name       = ""
    this.phase.status     = -1
    this.phase.type       = -1

    this.nameError      = false
    this.startDateError = false
    this.dueDateError   = false
    this.endDateError   = false
    this.typeError      = false
    this.statusError    = false

  this.save = ->
    if this.isValid()
      this.addClick {phase: this.phase}
      this.reset()

  this.validateField = (field) ->
    foundErrors = false
    fieldError  = "#{field}Error"

    if this.phase[field]?.length
      this[fieldError] = false
    else
      this[fieldError] = true
      foundErrors = true

  this.isValid = ->
    this.validateField('name')

    foundErrors = false

    if this.nameError || this.startDateError || this.dueDateError || this.endDateError || this.typeError || this.statusError
      foundErrors = true

    !foundErrors

  this.reset()
  activate()

controller.$inject = ['PhasesService', 'StepsAPIService']

angular.module('appirio-tech-ng-manage-phases').controller 'NewPhaseRowController', controller
