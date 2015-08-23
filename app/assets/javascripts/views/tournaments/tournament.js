DebateJudge.Views.Tournament = Backbone.View.extend({
  template: JST['tournaments/tournament'],
  className: 'panel panel-default',

  events: {
    "click .panel-heading": 'unhideRounds',
    "click .new_round_num": function(e) { e.preventDefault();},
  },

  render: function() {
    $(this.el).html(this.template({tournament: this.model, rounds: this.collection}))
    $(this.el).attr("href", "#");
    var view = new DebateJudge.Views.RoundsIndex({collection: this.collection, tournament: this.model});
    $(this.el).append(view.render().el);
    return this;
  },

  unhideRounds: function(e) {
    e.preventDefault();
    this.$(".rounds").toggleClass('hidden');
  },

  deleteTournament: function() {
    this.model.destroy();
  }
});
