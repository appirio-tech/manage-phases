(function() {
  'use strict';
  var dependencies;

  dependencies = ['ui.router', 'ngResource', 'app.constants', 'appirio-tech-ng-ui-components', 'appirio-tech-ng-api-services', 'react'];

  angular.module('appirio-tech-ng-manage-phases', dependencies);

}).call(this);

angular.module("appirio-tech-ng-manage-phases").run(["$templateCache", function($templateCache) {$templateCache.put("views/manage-phases.directive.html","<h4>ADD A PHASE</h4><hr class=biggest><phase-row phase add-click=vm.addPhase(phase)></phase-row><h4>PROJECT PHASES</h4><hr class=biggest><phase-list phases=vm.phases remove-phase=vm.removePhase(phase)></phase-list>");
$templateCache.put("views/new-phase-row.directive.html","<loader ng-show=newPhaseRowCtrl.loading></loader><form name=phase_row class=\"flex middle\"><input type=text ng-class=\"{error: newPhaseRowCtrl.nameError &amp;&amp; !newPhaseRowCtrl.name.length}\" placeholder=\"Name Phase\" ng-change=\"newPhaseRowCtrl.validateField(\'name\')\" ng-model=newPhaseRowCtrl.phase.name class=name><date-input place-holder=\"Start Date\" date=newPhaseRowCtrl.phase.startDate></date-input><date-input place-holder=\"Due Date\" date=newPhaseRowCtrl.phase.dueDate></date-input><date-input place-holder=\"End Date\" date=newPhaseRowCtrl.phase.endDate></date-input>{{newPhaseRowCtrl.types}}<dropdown options=newPhaseRowCtrl.types on-change=newPhaseRowCtrl.onTypeChange value=newPhaseRowCtrl.phase.type></dropdown><select ng-model=newPhaseRowCtrl.phase.type ng-options=\"type.value as type.name for type in newPhaseRowCtrl.types\" required></select><select ng-model=newPhaseRowCtrl.phase.status ng-options=\"status.value as status.name for status in newPhaseRowCtrl.statuses\" required></select><button ng-click=newPhaseRowCtrl.save() class=clean><div class=\"icon plus hollow\"></div></button></form>");
$templateCache.put("views/phase-list.directive.html","<h4>ADD A PHASE</h4><hr class=biggest><new-phase-row add-click=vm.addPhase(phase)></new-phase-row><h4>PROJECT PHASES</h4><hr class=biggest><ul><li><ul class=flex><li class=name><label>Phase Name</label></li><li class=date><label>Start Date</label></li><li class=date><label>Due Date</label></li><li class=date><label>End Date</label></li><li class=type><label>Phase Type</label></li><li class=status><label>Phase Status</label></li></ul></li><li ng-repeat=\"phase in phaseListCtrl.phases\"><phase-row phase=phase remove-click=vm.removePhase(phase)></phase-row></li></ul>");
$templateCache.put("views/phase-row.directive.html","<loader ng-show=phaseRowCtrl.loading></loader>{{phaseRowCtrl}}<form name=phase_row class=\"flex middle\"><input type=text ng-class=\"{error: phaseRowCtrl.nameError &amp;&amp; !phaseRowCtrl.name.length}\" placeholder=\"Name Phase\" ng-change=\"phaseRowCtrl.validateField(\'name\')\" ng-model=phaseRowCtrl.phase.name class=name><date-input place-holder=\"Start Date\" date=phaseRowCtrl.phase.startDate></date-input><date-input place-holder=\"Due Date\" date=phaseRowCtrl.phase.dueDate></date-input><date-input place-holder=\"End Date\" date=phaseRowCtrl.phase.endDate></date-input><select ng-model=phaseRowCtrl.phase.type ng-options=\"type.value as type.name for type in phaseRowCtrl.types\" required></select><select ng-model=phaseRowCtrl.phase.status ng-options=\"status.value as status.name for status in phaseRowCtrl.statuses\" required></select><button ng-class=\"{&quot;hollow&quot;:phaseRowCtrl.deleteCandidate===1}\" ng-hide=phaseRowCtrl.isInProgress() ng-click=phaseRowCtrl.remove() class=clean><div class=\"icon minus\"></div></button></form>");}]);
(function() {
  'use strict';
  var directive;

  directive = function() {
    return {
      restrict: 'E',
      controller: 'PhaseRowController as vm',
      templateUrl: 'views/phase-row.directive.html',
      bindToController: {
        phase: '&',
        removeClick: '&'
      }
    };
  };

  angular.module('appirio-tech-ng-manage-phases').directive('phaseRow', directive);

}).call(this);

(function() {
  'use strict';
  var directive;

  directive = function() {
    return {
      restrict: 'E',
      controller: 'PhaseListController',
      controllerAs: 'phaseListCtrl',
      templateUrl: 'views/phase-list.directive.html',
      bindToController: true,
      scope: {
        projectId: '@',
        phases: '='
      }
    };
  };

  angular.module('appirio-tech-ng-manage-phases').directive('phaseList', directive);

}).call(this);

(function() {
  'use strict';
  var directive;

  directive = function() {
    return {
      restrict: 'E',
      scope: {},
      controller: 'NewPhaseRowController as vm',
      templateUrl: 'views/new-phase-row.directive.html',
      bindToController: {
        addClick: '&'
      }
    };
  };

  angular.module('appirio-tech-ng-manage-phases').directive('newPhaseRow', directive);

}).call(this);

(function() {
  'use strict';
  var controller;

  controller = function(PhasesService, StepsAPIService) {
    var activate;
    this.types = angular.merge({}, PhasesService.getTypes(false));
    this.statuses = angular.merge({}, PhasesService.getStatuses(false));
    this.phase = this.phase();
    this.deleteCandidate = 1;
    this.nameError = false;
    this.startDateError = false;
    this.dueDateError = false;
    this.endDateError = false;
    this.typeError = false;
    this.statusError = false;
    activate = function() {
      return this;
    };
    this.isInProgress = function() {
      return PhasesService.isPhaseStatusInProgress(this.phase.status);
    };
    this.remove = function() {
      this.removeClick({
        phase: this.phase
      });
      return this.deleteCandidate = this.deleteCandidate === 0 ? 1 : 0;
    };
    this.validateField = function(field) {
      var fieldError, foundErrors, ref;
      foundErrors = false;
      fieldError = field + "Error";
      if ((ref = this.phase[field]) != null ? ref.length : void 0) {
        return this[fieldError] = false;
      } else {
        this[fieldError] = true;
        return foundErrors = true;
      }
    };
    this.isValid = function() {
      var foundErrors;
      this.validateField('name');
      foundErrors = false;
      if (this.nameError || this.startDateError || this.dueDateError || this.endDateError || this.typeError || this.statusError) {
        foundErrors = true;
      }
      return !foundErrors;
    };
    return activate();
  };

  controller.$inject = ['PhasesService', 'StepsAPIService'];

  angular.module('appirio-tech-ng-manage-phases').controller('PhaseRowController', controller);

}).call(this);

(function() {
  'use strict';
  var controller;

  controller = function(PhasesService) {
    var _projectId, activate, addPhase, getPhases, removePhase;
    _projectId = this.projectId;
    activate = function() {
      return getPhases();
    };
    removePhase = function(phase) {
      return {};
    };
    addPhase = function(phase) {
      return {};
    };
    getPhases = function() {
      return {};
    };
    return activate();
  };

  controller.$inject = ['$scope', 'PhasesService'];

  angular.module('appirio-tech-ng-manage-phases').controller('PhaseListController', controller);

}).call(this);

(function() {
  'use strict';
  var controller;

  controller = function(PhasesService, StepsAPIService) {
    var activate;
    this.types = angular.merge([], PhasesService.getTypes(true));
    this.statuses = angular.merge([], PhasesService.getStatuses(true));
    activate = function() {
      return this;
    };
    this.reset = function() {
      this.phase = {};
      this.phase.name = "";
      this.phase.status = -1;
      this.phase.type = -1;
      this.nameError = false;
      this.startDateError = false;
      this.dueDateError = false;
      this.endDateError = false;
      this.typeError = false;
      return this.statusError = false;
    };
    this.save = function() {
      if (this.isValid()) {
        this.addClick({
          phase: this.phase
        });
        return this.reset();
      }
    };
    this.validateField = function(field) {
      var fieldError, foundErrors, ref;
      foundErrors = false;
      fieldError = field + "Error";
      if ((ref = this.phase[field]) != null ? ref.length : void 0) {
        return this[fieldError] = false;
      } else {
        this[fieldError] = true;
        return foundErrors = true;
      }
    };
    this.isValid = function() {
      var foundErrors;
      this.validateField('name');
      foundErrors = false;
      if (this.nameError || this.startDateError || this.dueDateError || this.endDateError || this.typeError || this.statusError) {
        foundErrors = true;
      }
      return !foundErrors;
    };
    this.reset();
    return activate();
  };

  controller.$inject = ['PhasesService', 'StepsAPIService'];

  angular.module('appirio-tech-ng-manage-phases').controller('NewPhaseRowController', controller);

}).call(this);

(function() {
  'use strict';
  var PhasesService;

  PhasesService = function(StepsAPIService) {
    var addPhase, getStatuses, getTypes, isPhaseStatusInProgress, removePhase, updatePhase;
    getTypes = function(includePlaceholder) {
      var placeHolder;
      placeHolder = includePlaceholder ? [
        {
          label: 'Phase Type',
          value: -1
        }
      ] : [];
      return placeHolder.concat([
        {
          label: 'Project Submitted',
          value: 0
        }, {
          label: 'Project Launched',
          value: 1
        }
      ]);
    };
    getStatuses = function(includePlaceholder) {
      var placeHolder;
      placeHolder = includePlaceholder ? [
        {
          label: 'Status',
          value: -1
        }
      ] : [];
      return placeHolder.concat([
        {
          label: 'Scheduled',
          value: 0
        }, {
          label: 'In Progress',
          value: 1
        }, {
          label: 'Closed',
          value: 2
        }
      ]);
    };
    isPhaseStatusInProgress = function(status) {
      return status > 0;
    };
    addPhase = function(projectId, phase) {
      var params;
      params = {
        projectId: projectId,
        stepId: stepId
      };
      return StepsAPIService.save(params, phase).$promise;
    };
    updatePhase = function(projectId, phase) {
      var params;
      params = {
        projectId: projectId,
        stepId: stepId
      };
      return StepsAPIService.patch(params, phase).$promise;
    };
    removePhase = function(projectId, phase) {
      var params;
      params = {
        projectId: projectId,
        stepId: stepId
      };
      return StepsAPIService.remove(params).$promise;
    };
    return {
      getTypes: getTypes,
      getStatuses: getStatuses,
      isPhaseStatusInProgress: isPhaseStatusInProgress
    };
  };

  PhasesService.$inject = ['StepsAPIService'];

  angular.module('appirio-tech-ng-manage-phases').factory('PhasesService', PhasesService);

}).call(this);
