DebateJudge.Views.RoundsIndex = Backbone.View.extend({
  template: JST['rounds/index'],
  className: 'rounds panel-body hidden',

  events: {
    'click .roundAdd':        'openForm',
    'submit .new_round':      'addRound',
    'click .delete_tourney':  'confirmDelete',
    'click .open-round':      'openRound'
  },

  initialize: function(opts) {
    this.tournament = opts.tournament;
    this.listenTo(this.collection, 'sort', this.render);
  },

  render: function() {
    // this.filterEvents();
    this.$el.html(this.template({collection: this.collection}));
    return this;
  },

  filterEvents: function() {
    // Finish refactoring this
    this.lincoln = new DebateJudge.Collections.Rounds({collection: this.collection.where({event: "Lincoln Douglas"})});
    //this.parli = new DebateJudge.Collections.Rounds @collection.where event: "Parli";
   // this.policy = new DebateJudge.Collections.Rounds @collection.where event: "Policy";
    //this.public = new DebateJudge.Collections.Rounds @collection.where event: "Public Forum";
  },

  addRound: function(e) {
    e.preventDefault();
    var event_type = this.$('.new_round_event').val();
    var round_num = this.$('.new_round_num').val();
    var round_notes = this.$('.new_round_notes').val();

    this.collection.create({
      tournament_id: this.tournament.id,
      event: event_type,
      round_num: round_num,
      notes: round_notes
    }, {
      wait: true,
      success: function(model, response) {
        page("/rounds/" + response.id);
      },
      error: function(response) {
        alert("That round already exists");
      }});
  },

  confirmDelete: function(e) {
    e.stopPropagation();
    var self = this;
    $('.modal-dialog').addClass('modal-sm');
    $('.modal-content').html(JST['confirm_delete']);
    $('#myModal').modal('show');
    $('.modal-footer .btn-danger').on('click', function() {
      $('#myModal').modal('hide');
      self.deleteTournament();
    });
  },

  deleteTournament: function() {
    this.tournament.destroy();
  },

  openRound: function(e) {
    e.preventDefault();
    var round_id = $(e.currentTarget).data('id');
    page("/rounds/" + round_id, round_id);
  },

  openForm: function(e) {
    e.preventDefault();
    this.$('.new_round').removeClass('hidden');
  }
});
