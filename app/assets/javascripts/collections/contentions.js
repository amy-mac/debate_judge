DebateJudge.Collections.Contentions = Backbone.Collection.extend({
  url: '/api/contentions',
  model: DebateJudge.Models.Contention,
  comparator: 'created_at'
});
