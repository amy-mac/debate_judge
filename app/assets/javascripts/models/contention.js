DebateJudge.Models.Contention = Backbone.Model.extend({
  urlRoot: '/api/contentions',
  paramRoot: 'contention',

  editContention: function (value) {
    this.save(contention: value);
  },

  refuteContention: function () {
    if (this.get('refuted') == false) {
      this.save(refuted: true);
    } else {
      this.save(refuted: false);
    }
  }
});
