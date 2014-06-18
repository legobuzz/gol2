Cell = require 'models/cell'

class World

	#
	# Constructor
	# @param multi integer for multi * multi size of cells 
	#
	constructor: (multiplier) ->

		# create multi * multi cells
		@cells = []
		for y in [0...multiplier]
			for x in [0...multiplier]
				@cells.push new Cell x, y, false
	#
	#if found it returns the cell object at position x-y
	#
	findCell: (x, y) ->
		for cell in @cells
			if cell.x is x and cell.y is y
				return cell
		return null

	#
	#if found it returns the cell object at position x-y
	#
	toggleCellVitality: (x, y) ->
		cell = @findCell x, y
		if cell
			cell.alive = not cell.alive

	#
	#Executes the next step in the Game of Life evolution
	#
	nextStep: ->
		for cell, i in @cells
			aliveNeighbours = 0
			for dx in [-1..1]
				for dy in [-1..1]
					cellNeighbour = @findCell cell.x + dx, cell.y + dy 
					if cellNeighbour
						if cellNeighbour.alive
							aliveNeighbours++
			if cell.alive
				aliveNeighbours--
			cell.future = cell.golLogic aliveNeighbours
		for cell in @cells
			cell.alive = cell.future

module.exports = World