require 'appirio-tech-api-schemas'
require './styles/main.scss'
require './scripts/mock'
require './scripts/example.module'
require './scripts/routes'
require './scripts/new-phase-row.example'
require './scripts/phase-list.example'
require './scripts/phase-row.example'

exampleNav = require './nav.jade'

$('#example-nav').html exampleNav()

views = require.context './views/', true, /^(.*\.(jade$))[^.]*$/igm
viewPaths = views.keys()

templateCache = ($templateCache) ->
  for viewPath in viewPaths
    viewPathClean = viewPath.split('./').pop()

    # TODD: bug if .jade occurs more often than once
    viewPathCleanHtml = viewPathClean.replace '.jade', '.html'

    $templateCache.put "views/#{viewPathCleanHtml}", views(viewPath)()

templateCache.$nject = ['$templateCache']

angular.module('example').run templateCache
