_ = require 'underscore'

World = null
world = null

describe 'World',->

	beforeEach ->
		World = require 'models/world'
		world = new World 5

	it 'should exist and be instantiable', ->
		world = new World
		expect(world).to.be.an.instanceof World

	it 'should initialize list cells with n times n positions when n is passed to constructor', ->
		world = new World 5
		expect(world.cells.length).to.equal 25

	it 'should have a function #findCell', ->
		world = new World
		expect(world.findCell).to.be.a 'function'

	it 'should have a function #toggleCellVitality', ->
		worl = new World
		expect(world.toggleCellVitality).to.be.a 'function'

	it 'should have a function #nextStep', ->
		world = new World
		expect(world.nextStep).to.be.a 'function'
  
	describe 'list cells', ->
    
		it 'should contain Cell objects', ->
			for cell in world.cells
			  expect(cell).to.be.instanceof Cell

		it 'should contain only dead cells', ->
			for cell in world.cells
				expect(cell.alive).to.be.false

		it 'should initialize the cells in a x-y grid', ->
			for cell, i in world.cells
				expect(cell.x).to.equal i % 5
				if i % 5 is 0
					j = i/ 5
				expect(cell.y).to.equal j

	describe '#findCell', ->

		it 'should return cell object when x-y position is passed to function', ->
			expect(world.findCell 2, 1).to.be.instanceof Cell

	describe '#toggleCellVitality', ->

		it 'should toogle vitality of cell when x-y position is passed to function', ->
			world.toggleCellVitality 2, 3
			cell = world.findCell 2, 3
			expect(cell.alive).to.equal true

	describe '#nextStep', ->

		it 'should make future variables of cells have values to behave like in the "Block" still life', ->
			world.toggleCellVitality 1, 1
			world.toggleCellVitality 1, 2
			world.toggleCellVitality 2, 1
			world.toggleCellVitality 2, 2

			expectedArray = [
				[false, false, false, false, false]
				[false, true,  true,  false, false]
				[false, true,  true,  false, false]
				[false, false, false, false, false]
				[false, false, false, false, false]
			]

			world.nextStep()
			expect(world.cells).to.matchPattern expectedArray

		it 'should make future variables of cells have values to behave like in the "Blinker" oscillator', ->
			world.toggleCellVitality 1, 2
			world.toggleCellVitality 2, 2
			world.toggleCellVitality 3, 2

			expectedArray = [
				[false, false, false, false, false]
				[false, false, true,  false, false]
				[false, false, true,  false, false]
				[false, false, true,  false, false]
				[false, false, false, false, false]
			]

			world.nextStep()
			expect(world.cells).to.matchPattern expectedArray

		it 'should make future variables of cells have values to behave like in the "Toad" oscillator', ->
			world = new World 6

			world.toggleCellVitality 1, 3
			world.toggleCellVitality 2, 3
			world.toggleCellVitality 3, 3
			world.toggleCellVitality 2, 2
			world.toggleCellVitality 3, 2
			world.toggleCellVitality 4, 2

			expectedArray = [
				[false, false, false, false, false, false]
				[false, false, false, true, false, false]
				[false, true, false, false, true, false]
				[false, true, false, false, true, false]
				[false, false, true, false, false, false]
				[false, false, false, false, false, false]
			]

			world.nextStep()
			expect(world.cells).to.matchPattern expectedArray