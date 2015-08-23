DebateJudge.Views.TournamentsIndex = Backbone.View.extend({
  template: JST['tournaments/index'],
  className: 'container',

  events: {
    'submit #new_tourney': 'createTournament',
    'click #tourney_add':  'openForm'
  },

  initialize: function(opts) {
    this.listenTo(this.collection, 'sort', this.render);
    this.listenTo(this.collection, 'remove', this.render);
    this.rounds = opts.rounds;
  },

  render: function() {
    this.collection.models.reverse();

    this.$('#tournament').empty();
    $(this.el).html(this.template);

    if (this.collection.length == 0) {
      this.$('#tournaments').html("<p class='alert alert-warning'>There are no tournaments yet. Why don't you add one?</p>");
    }

    this.collection.each(this.appendTournament, this);

    this.recentRounds();
    return this;
  },

  attributes: function() {
    return {
      tournament: $('#new_tourney_tournament').val(),
      school: $('#new_tourney_school').val(),
      date: $('#new_tourney_date').val()
    };
  },

  createTournament: function(e) {
    e.preventDefault();
    this.collection.create(this.attributes());
    $('#new_tourney').addClass('hidden');
    $('#new_tourney_tournament').val('');
    $('#new_tourney_school').val('');
    $('#new_tourney_date').val('');
  },

  appendTournament: function(tourney) {
    var rounds = new DebateJudge.Collections.Rounds(this.rounds.filter(function(round) {
      return (round.get('tournament_id')) == tourney.id;
    }));
    var view = new DebateJudge.Views.Tournament({model: tourney, collection: rounds});
    this.$('#tournaments').append(view.render().el);
  },

  openForm: function(e) {
    e.preventDefault();
    $('#new_tourney').toggleClass('hidden');
  },

  // Creates a view for the recent rounds
  recentRounds: function() {
    var view2 = new DebateJudge.Views.RoundsRecent({collection: this.rounds});
    view2.comparator = 'updated_at';
    this.$('aside').append(view2.render().el);
  }
});
