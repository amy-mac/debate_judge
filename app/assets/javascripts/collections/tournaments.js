DebateJudge.Collections.Tournaments = Backbone.Collection.extend({
  url: '/api/tournaments',
  model: DebateJudge.Models.Tournament,
  comparator: 'date'
});
