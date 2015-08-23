DebateJudge.Collections.Rounds = Backbone.Collection.extend({
  url: '/api/rounds',
  model: DebateJudge.Models.Round,
  comparator: 'round_num'
});
