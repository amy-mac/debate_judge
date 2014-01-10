#= require spec_helper

describe 'DebateJudge.Collections.Tournaments', ->
  beforeEach ->
    # Sinon fake server for backend requests
    @server = sinon.fakeServer.create()

    # Server automatically responds to XHR requests
    @server.autoRespond = true

    # Create a reference for all internal suites/specs
    @tournaments = new DebateJudge.Collections.Tournaments()

  afterEach ->
    # Stop fake server
    @server.restore()

  describe 'retrieval', ->
    it 'has default values', ->
      expect(@tournaments).to.be.ok
      expect(@tournaments).to.have.length(0)

    it 'should be empty on fetch', (done) ->
      tournaments = @tournaments

      @server.respondWith "GET", "/api/tournaments", [200,
        "Content-Type": "application/json"
      , "[]"]

      # Before fetch
      expect(tournaments).to.be.ok
      expect(tournaments).to.have.length(0)

      # After fetch
      tournaments.once "reset", ->
        expect(tournaments).to.have.length(0)
        done()

      tournaments.fetch reset: true

    it 'has a single tournament', (done) ->
      tournaments = @tournaments

      @server.respondWith "GET", "/api/tournaments", [200,
        "Content-Type": "application/json",
        JSON.stringify([{
          id: 1,
          tournament: "Test Tourney",
          school: "Bishop",
          date: "3/4/1000",
          user_id: 1
        }])
      ]

      # After fetch
      tournaments.once "reset", ->
        expect(tournaments).to.have.length(1)

        # Check model attributes
        tournament = tournaments.at(0)
        expect(tournament).to.be.ok
        expect(tournament.get 'tournament').to.contain("Tourney")
        expect(tournament.get 'school').to.contain("Bishop")

        done()

      tournaments.fetch reset: true


  describe 'modification', ->

    beforeEach ->
      @tournament1 = new DebateJudge.Models.Tournament
        id: 1
        tournament: "Test Tourney"
        school: 'West middle'
        date: '10/12/2990'
        user_id: 1
      @tournament2 = new DebateJudge.Models.Tournament
        id: 2
        tournament: "My thing"
        school: "Bishop"
        date: '11/13/2009'
        user_id: 1

      # Simulate the starting point for the collection
      @tournaments.add(@tournament1)

    it 'can delete a tournament', (done) ->
      tournaments = @tournaments

      # After shift
      tournaments.once 'remove', ->
        expect(tournaments).to.have.length(0)
        done()

      # Remove and return first model
      tournament = tournaments.shift()
      expect(tournament).to.be.ok

    it 'can create a second tournament', (done) ->
      tournaments = @tournaments
      tournaments.create(@tournament2)

      # GET returns 2 models
      @server.respondWith 'GET', '/api/tournaments', [200,
        'Content-Type': 'application/json',
        JSON.stringify [@tournament1, @tournament2]
      ]

      # After fetch
      tournaments.once 'reset', ->
        expect(tournaments).to.have.length(2)

        # Check model attributes
        tournament = tournaments.at(1)
        expect(tournament).to.be.ok
        expect(tournament.get 'school').to.contain('Bishop')
        expect(tournament.get 'tournament').to.contain('thing')

        done()

      tournaments.fetch reset: true

    it 'keeps collection sorted by date'