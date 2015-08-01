DebateJudge.Views.Round = Backbone.View.extend({
  template: JST['rounds/round'],

  events: {
    'click .glyphicon-remove': 'confirmDelete',
    'click #toggle-timer':     'toggleTimer',
    'click #set-timer':        'setTimer',
    'click #reset-timer':      'resetTimer'
  },

  initialize: function() {
    this.listenTo(this.model, 'reset', this.render);
    this.listenTo(this.model, 'sync', this.render);
    $(window).resize(_.debounce(this.changeSpeechWrapper, 200));
    this.collection = new DebateJudge.Collections.Contentions(this.collection.where({round_id: this.model.id}));
    this.listenTo(this.collection, 'remove', this.render);
    switch(this.model.get('event')) {
      case "Policy":
        this.speeches = [
          '1AC',
          'Cross Examination 1',
          '1NC',
          'Cross Examination 2',
          '2AC',
          'Cross Examination 3',
          '2NC',
          'Cross Examination 4',
          '1NR',
          '1AR',
          '2NR',
          '2AR'
        ];
        break;
      case "Public Forum":
        this.speeches = [
          'Aff1',
          'Neg1',
          'Crossfire1',
          'Aff2',
          'Neg2',
          'Crossfire2',
          'Aff3',
          'Neg3',
          'Crossfire3',
          'Aff4',
          'Neg4'
        ];
        break;
      case 'Lincoln Douglas':
        this.speeches = [
          'First Affirmative',
          'Cross Examination 1',
          'First Negation',
          'Cross Examination 2',
          'Second Affirmative',
          'Second Negation',
          'Third Affirmative'
        ];
        break;
      default:
        this.speeches = ['Aff1', 'Neg1', 'Aff2', 'Neg2', 'Neg3', 'Aff3'];
    }
  },

  render: function() {
    $(this.el).html(this.template({round: this.model, speeches: this.speeches}))
    var self = this;
    _.each(this.speeches, function(speech) {
      self.appendSpeech(speech);
    });
    this.changeSpeechWrapper();
    return this;
  },

  appendSpeech: function(speech) {
    var contentions = this.collection.filter(function(contention) {
      return contention.get('speech_type') == speech;
    });
    contentions = new DebateJudge.Collections.Contentions(contentions);
    var view = new DebateJudge.Views.ContentionsIndex({collection: contentions, model: this.model, speech: speech});
    this.$("#speech-area").append(view.render().$el);
  },

  confirmDelete: function(e) {
    e.stopPropagation();
    var self = this;
    $('.modal-dialog').addClass('modal-sm');
    $('.modal-content').html(JST['confirm_delete']);
    $('#myModal').modal('show');
    $('.modal-footer .btn-danger').on('click', function() {
      $('#myModal').modal('hide');
      self.deleteRound();
    });
  },

  deleteRound: function() {
    this.model.destroy({
      success: function(model, response) {
        page('/tournaments');
      },
      error: function(model, response) {
        // TODO: better error display here
        alert("Something went wrong");
      }});
  },

  // Start and Stop Timer
  toggleTimer: function(e) {
    this.$('#runner').runner('toggle');
    if(this.$('#toggle-timer').html() == "Start") {
      this.$('#toggle-timer').html("Stop");
    } else {
      this.$('#toggle-timer').html("Start");
    }
  },

  // Initializes the timer function
  timerFunction: function(value) {
    this.$("#set-timer-input").addClass('hidden');
    this.$("#runner").removeClass('hidden');
    this.$("#runner").runner({
      countdown: true,
      startAt: value * 60 * 1000,
      stopAt: 0,
      milliseconds: false
    }).on("runnerFinish", function(eventObject, info) {
      $("#runner").css('color', 'red');
    });
  },

  // Sets the value for the timer
  setTimer: function() {
    var newValue = this.$("#set-timer-input input").val();
    this.timerFunction(newValue);
    this.$('#set-timer').addClass('hidden');
    this.$('#reset-timer').removeClass('hidden');
  },

  // Opens up the set timer form
  resetTimer: function() {
    this.$("#runner").addClass("hidden");
    this.$("#set-timer-input").removeClass('hidden');
    this.$('#set-timer').removeClass('hidden');
    this.$('#reset-timer').addClass('hidden');
    $('#runner').css('color', 'black');
  },

  // makes the Round workspace responsive
  changeSpeechWrapper: function(e) {
    var $winHeight = $(window).height();
    var height = $winHeight - 120;
    var areaheight = $winHeight - 230;
    this.$('#speech-wrapper').css({'height': height + "px"});
    this.$('.speech-contentions').css({'max-height': areaheight + 'px'});
  }
});
