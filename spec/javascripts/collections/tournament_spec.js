//= require spec_helper
//= require collections/tournaments

describe('DebateJudge.Collections.Tournaments', function() {
  beforeEach(function() {
    // Sinon fake server for backend requests
    this.server = sinon.fakeServer.create();

    // Server automatically responds to XHR requests
    this.server.autoRespond = true;

    // Create a reference for all internal suites/specs
    this.tournaments = new DebateJudge.Collections.Tournaments();
  });

  afterEach(function() {
    // Stop fake server
    this.server.restore();
  });

  describe('retrieval', function() {
    it('has default values', function() {
      expect(this.tournaments).to.be.ok;
      expect(this.tournaments).to.have.length(0);
    });

    it('should be empty on fetch', function(done) {
      var tournaments = this.tournaments;

      this.server.respondWith("GET", "/api/tournaments", [200,
        {"Content-Type": "application/json"}
      , "[]"]);

      // Before fetch
      expect(tournaments).to.be.ok;
      expect(tournaments).to.have.length(0);

      // After fetch
      tournaments.once("reset", function() {
        expect(tournaments).to.have.length(0);
        done();
      });

      tournaments.fetch({reset: true});
    });

    it('has a single tournament', function(done) {
      var tournaments = this.tournaments;

      this.server.respondWith("GET", "/api/tournaments", [200,
        {"Content-Type": "application/json"},
        JSON.stringify([{
          id: 1,
          tournament: "Test Tourney",
          school: "Bishop",
          date: "3/4/1000",
          user_id: 1
        }])
      ]);

      // After fetch
      tournaments.once("reset", function() {
        expect(tournaments).to.have.length(1);

        // Check model attributes
        tournament = tournaments.at(0);
        expect(tournament).to.be.ok;
        expect(tournament.get('tournament')).to.contain("Tourney");
        expect(tournament.get('school')).to.contain("Bishop");

        done();
      });

      tournaments.fetch({reset: true});
    });
  });


  describe('modification', function() {

    beforeEach(function() {
      this.tournament1 = new DebateJudge.Models.Tournament({
        id: 1,
        tournament: "Test Tourney",
        school: "West middle",
        date: "10/12/2990",
        user_id: 1
      });
      this.tournament2 = new DebateJudge.Models.Tournament({
        id: 2,
        tournament: "My thing",
        school: "Bishop",
        date: "11/13/2009",
        user_id: 1
      });

      // Simulate the starting point for the collection
      this.tournaments.add(this.tournament1);
    });

    it('can delete a tournament', function(done) {
      var tournaments = this.tournaments;

      // After shift
      tournaments.once('remove', function() {
        expect(tournaments).to.have.length(0);
        done();
      });

      // Remove and return first model
      tournament = tournaments.shift();
      expect(tournament).to.be.ok;
    });

    it('can create a second tournament', function(done) {
      var tournaments = this.tournaments;
      tournaments.create(this.tournament2);

      // GET returns 2 models
      this.server.respondWith('GET', '/api/tournaments', [200,
        {'Content-Type': 'application/json'},
        JSON.stringify([this.tournament1, this.tournament2])
      ]);

      // After fetch
      tournaments.once('reset', function() {
        expect(tournaments).to.have.length(2);

        // Check model attributes
        tournament = tournaments.at(1);
        expect(tournament).to.be.ok;
        expect(tournament.get('school')).to.contain('Bishop');
        expect(tournament.get('tournament')).to.contain('thing');

        done();
      });

      tournaments.fetch({reset: true});
    });
  });

//    it('keeps collection sorted by date')
});
