require 'angular'
require 'angular-route'
require 'ui-bootstrap-tpls'

app = angular.module 'App', [
  'ngRoute'
  'ui.bootstrap'
]

app.config [
  '$routeProvider', ($routeProvider) ->

]

angular.element(document).ready ->
  angular.bootstrap document, ['App']

app.run ($rootScope, $location) ->

module.exports = app
