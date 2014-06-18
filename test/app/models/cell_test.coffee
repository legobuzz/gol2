Cell = null

describe 'Cell', ->

	before ->
		Cell = require 'models/cell'

	it 'should exist', ->		
		expect(Cell).to.be.a 'function'

	it 'should be instantiable', ->
		cell = new Cell
		expect(cell).to.be.an.instanceof Cell

	it 'should define a x/y position, alive and future variable', ->
		cell = new Cell
		expect(cell).to.have.keys 'x', 'y', 'alive', 'future'

	it 'should set x/y position that is passed to constructor', ->
		cell = new Cell 2, 3
		expect(cell).to.have.property 'x', 2
		expect(cell).to.have.property 'y', 3

	it 'should set alive (true) or dead (false) condition that is passed to constructor', ->
		cell = new Cell 2,3,true
		expect(cell).to.have.property 'alive', true

	it 'should have a function #golLogic', ->
		cell = new Cell
		expect(cell.golLogic).to.be.a 'function'

	describe '#golLogic', ->

		cell = null

		describe 'given cell is alive', ->
			
			beforeEach ->
				cell = new Cell 2, 3, true

			it 'should return false if passed a value < 2', ->
				expect(cell.golLogic(1)).to.equal false

			it 'should return true if passed value 2 or 3', ->
				expect(cell.golLogic(2)).to.equal true
				expect(cell.golLogic(3)).to.equal true

			it 'should return false if passed a value > 3', ->
				expect(cell.golLogic(4)).to.equal false

		describe 'given cell is dead', ->

			beforeEach ->
				cell = new Cell 2, 3, false

			it 'should return true if passed value 3', ->
				expect(cell.golLogic(3)).to.equal true