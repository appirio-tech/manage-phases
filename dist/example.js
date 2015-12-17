angular.module("app.constants", [])

.constant("API_URL", "https://api.topcoder.com")

.constant("AVATAR_URL", "https://www.topcoder.com")

.constant("SUBMISSION_URL", "https://studio.topcoder.com")

.constant("AUTH0_CLIENT_ID", "abc123")

.constant("AUTH0_DOMAIN", "topcoder.auth0.com")

.constant("AUTH0_TOKEN_NAME", "userJWTToken")

.constant("AUTH0_REFRESH_TOKEN_NAME", "userRefreshJWTToken")

;
(function() {
  'use strict';
  var dependencies;

  dependencies = ['ui.router', 'ngResource', 'app.constants', 'appirio-tech-ng-manage-phases'];

  angular.module('example', dependencies);

}).call(this);

angular.module("example").run(["$templateCache", function($templateCache) {$templateCache.put("views/new-phase-row.example.html","<new-phase-row></new-phase-row><new-phase-row add-click=vm.addRowClick(phase)></new-phase-row>");
$templateCache.put("views/phase-list.example.html","<phase-list project-id=abc phases=vm.phases></phase-list>");
$templateCache.put("views/phase-row.example.html","<phase-row phase=vm.phase></phase-row><phase-row phase=vm.phaseInactive remove-click=vm.removeClick()></phase-row>");}]);
(function() {
  'use strict';
  var config;

  config = function($stateProvider) {
    var key, results, state, states;
    states = {};
    states['phase-row'] = {
      url: '/row',
      title: 'phase-row',
      controller: 'PhaseRowExampleController as vm',
      templateUrl: 'views/phase-row.example.html'
    };
    states['new-phase-row'] = {
      url: '/new-row',
      title: 'new-phase-row',
      controller: 'NewPhaseRowExampleController as vm',
      templateUrl: 'views/new-phase-row.example.html'
    };
    states['phase-list'] = {
      url: '/list',
      title: 'phase-list',
      controller: 'PhaseListExampleController as vm',
      templateUrl: 'views/phase-list.example.html'
    };
    states['manage-phases'] = {
      url: '/',
      title: 'manage-phases',
      controller: 'ManagePhasesExampleController as vm',
      templateUrl: 'views/manage-phases.example.html'
    };
    results = [];
    for (key in states) {
      state = states[key];
      results.push($stateProvider.state(key, state));
    }
    return results;
  };

  config.$inject = ['$stateProvider'];

  angular.module('example').config(config).run();

}).call(this);

(function() {
  'use strict';
  var controller;

  controller = function() {
    var activate, vm;
    vm = this;
    activate = function() {
      vm.phase = {
        name: 'batman',
        startDate: '2015-12-01',
        endDate: '2015-12-01',
        dueDate: '2015-12-01',
        type: 1,
        status: 0
      };
      vm.phaseInactive = {
        name: 'batman',
        startDate: '2015-12-01',
        endDate: '2015-12-01',
        dueDate: '2015-12-01',
        type: 1,
        status: 1
      };
      return vm;
    };
    vm.removeClick = function() {
      return vm.phase = {};
    };
    return activate();
  };

  controller.$inject = [];

  angular.module('example').controller('PhaseRowExampleController', controller);

}).call(this);

(function() {
  'use strict';
  var controller;

  controller = function() {
    var activate, vm;
    vm = this;
    activate = function() {
      return {};
    };
    vm.addRowClick = function(phase) {
      vm.phase = {};
      return vm;
    };
    return activate();
  };

  controller.$inject = [];

  angular.module('example').controller('NewPhaseRowExampleController', controller);

}).call(this);

(function() {
  'use strict';
  var controller;

  controller = function() {
    var activate, vm;
    vm = this;
    vm.phases = [];
    activate = function() {
      var i, j;
      for (i = j = 0; j <= 5; i = ++j) {
        vm.phases.push({
          name: 'batman ' + i,
          startDate: '2015-12-01',
          endDate: '2015-12-01',
          dueDate: '2015-12-01',
          type: 'a',
          status: 'b'
        });
      }
      return vm;
    };
    return activate();
  };

  controller.$inject = [];

  angular.module('example').controller('PhaseListExampleController', controller);

}).call(this);
