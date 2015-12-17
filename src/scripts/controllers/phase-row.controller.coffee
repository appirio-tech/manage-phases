'use strict'

controller = (PhasesService, StepsAPIService) ->
  this.types            = angular.merge {}, PhasesService.getTypes(false)
  this.statuses         = angular.merge {}, PhasesService.getStatuses(false)

  this.phase = this.phase()
  this.deleteCandidate  = 1

  this.nameError      = false
  this.startDateError = false
  this.dueDateError   = false
  this.endDateError   = false
  this.typeError      = false
  this.statusError    = false

  activate = ->
    this

  this.isInProgress = ->
    PhasesService.isPhaseStatusInProgress(this.phase.status)

  this.remove = ->
    this.removeClick {phase: this.phase}
    this.deleteCandidate = if this.deleteCandidate == 0 then 1 else 0

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

  activate()

controller.$inject = ['PhasesService', 'StepsAPIService']

angular.module('appirio-tech-ng-manage-phases').controller 'PhaseRowController', controller
