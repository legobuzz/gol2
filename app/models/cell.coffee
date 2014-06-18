class Cell
	constructor: (x, y, alive) ->
		@x = x
		@y = y
		@alive = alive
		@future = null

	golLogic: (aliveNeighbours) ->
		isAliveCellWithTwoNeighbours = @alive and aliveNeighbours is 2
		hasThreeNeighbours           = aliveNeighbours is 3
		isAliveCellWithTwoNeighbours or hasThreeNeighbours

module.exports = Cell
