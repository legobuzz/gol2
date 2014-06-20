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

	World = require 'models/world'
	world = new World 5

	$rootScope.world = world

	world.toggleCellVitality 1, 3
	world.toggleCellVitality 2, 3
	world.toggleCellVitality 3, 3
	world.toggleCellVitality 2, 2
	world.toggleCellVitality 3, 2
	world.toggleCellVitality 4, 2

	setInterval(
		->
			world.nextStep()
			console.log "step!"
			$rootScope.$apply();
		, 150
	)

module.exports = app