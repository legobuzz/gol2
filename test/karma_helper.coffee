require 'angular'
require 'angular-mocks'
_ = require 'underscore'

chai.use (chai, utils) ->

  chai.Assertion.addMethod 'matchPattern', (expectedPattern, options = {}) ->

      cells = @_obj

      cellsFutureInArray = _.pluck(cells, 'future').join(',')
      result = cellsFutureInArray is expectedPattern.join(',')

      @assert(
        result
        '
          expected pattern\n
          \t#{act}\n
          to match\n
          \t#{exp}
        '
        '
          expected pattern not to match expected\n
          \t#{act}
        '
        expectedPattern.join(',')
        cellsFutureInArray
      )