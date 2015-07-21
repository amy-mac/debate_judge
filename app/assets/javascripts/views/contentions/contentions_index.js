DebateJudge.Views.ContentionsIndex = Backbone.View.extend({
  template: JST['contentions/index'],
  className: 'speech',

  events: {
    'click .open-composer':         'openForm',
    'click button':                 'closeForm',
    'click .new-contention-submit': 'createContention',
    'keypress .new-contention':     'createEnter'
  },

  initialize: function(opts) {
    this.speech = opts.speech;
    this.listenTo(this.collection, 'reset', this.render);
    this.listenTo(this.collection, 'add', this.appendContention);
  },

  render: function() {
    $(this.el).html(this.template({speech: this.speech}));
    $(this.el).attr("data-id", this.speech);
    this.collection.each(this.appendContention, this);
    return this;
  },

  openForm: function(e) {
    e.preventDefault();
    this.$('.contention-composer').removeClass('hidden');
    this.$('.new-contention').focus();
    this.$('.open-composer').addClass('hidden');
  },

  closeForm: function(e) {
    this.$('.contention-composer').addClass('hidden');
    this.$('.open-composer').removeClass('hidden');
  },

  createEnter: function(e) {
    if(e.which == 13 && !e.shiftKey) {
      this.createContention(e);
    }
  },

  createContention: function(e) {
    e.preventDefault();
    var contention = this.$(".new-contention").val();
    this.collection.create({speech_type: this.speech, contention: contention, round_id: this.model.id});
    this.$('textarea').val('');
    this.scrollToBottom();
  },

  appendContention: function(contention) {
    var view = new DebateJudge.Views.Contention({model: contention});
    this.$('.contentions').append(view.render().$el);
  },

  scrollToBottom: function() {
    var $test = this.$('.speech-contentions');
    $test.scrollTop($test.prop('scrollHeight'));
  }
});
