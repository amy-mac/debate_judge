DebateJudge.Views.RoundsRecent = Backbone.View.extend({
  template: JST['rounds/recent'],
  tagName: 'ul',

  initialize: function() {
    this.listenTo(this.collection, 'sort', this.render);
  },

  render: function() {
    this.filterRounds();
    this.$el.html(this.template({recent: this.recent}));
    return this;
  },

  filterRounds: function() {
    this.recent = new DebateJudge.Collections.Rounds(this.collection.last(5));
    this.recent.comparator = 'updated_at';
    this.recent.sort().models.reverse();
  }
});
