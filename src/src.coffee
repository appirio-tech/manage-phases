require.context './styles/', true, /^(.*\.(scss$))[^.]*$/igm
# require.context './images/', true, /^(.*\.(svg$))[^.]*$/igm

require 'appirio-tech-ng-ui-components'
require 'appirio-tech-ng-api-services'
require './scripts/manage-phases.module'

requireContextFiles = (files) ->
  paths = files.keys()

  for path in paths
    files path

directives  = require.context './scripts/directives/', true, /^(.*\.(coffee$))[^.]*$/igm
controllers = require.context './scripts/controllers/', true, /^(.*\.(coffee$))[^.]*$/igm

requireContextFiles directives
requireContextFiles controllers

views     = require.context './views/', true, /^(.*\.(jade$))[^.]*$/igm
viewPaths = views.keys()

templateCache = ($templateCache) ->
  for viewPath in viewPaths
    viewPathClean = viewPath.split('./').pop()

    # TODD: bug if .jade occurs more often than once
    viewPathCleanHtml = viewPathClean.replace '.jade', '.html'

    $templateCache.put "views/#{viewPathCleanHtml}", views(viewPath)()

templateCache.$nject = ['$templateCache']

angular.module('appirio-tech-ng-manage-phases').run templateCache

