assert = require 'power-assert'
sinon = require 'sinon'

describe 'arm', ->
  beforeEach ->
    @sinon = sinon.sandbox.create()

  afterEach ->
    @sinon.restore()

  describe 'module.exports', ->
    it 'is function', ->
      arm = require '../'
      assert typeof arm is 'function'

    it 'add "arm" function to argument[0]', ->
      robot = {}
      require('../') robot
      assert robot.hasOwnProperty 'arm'
      assert typeof robot.arm is 'function'

  describe '"arm" function', ->
    beforeEach ->
      @robot = {}
      require('../') @robot
      @arm = @robot.arm

    describe 'call with "request"', ->
      it 'requires "hubot-request-arm"', ->
        assert typeof @arm('request') is 'function'

    describe 'call with "noexist"', ->
      it 'requires "hubot-noexist-arm" and throw Error', ->
        try
          @arm('noexist')
        catch e
          assert e.message is 'Cannot find module \'hubot-noexist-arm\''
