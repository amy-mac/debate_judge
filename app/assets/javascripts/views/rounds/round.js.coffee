class DebateJudge.Views.Round extends Backbone.View
  template: JST['rounds/round']

  events:
    'click .glyphicon-remove': 'deleteRound'
    'click #toggle-timer': 'toggleTimer'
    'click #set-timer': 'setTimer'
    'click #reset-timer': 'resetTimer'

  initialize: ->
    @model.on('reset', @render, this)
    @contentions = new DebateJudge.Collections.Contentions @collection.where round_id: @model.id
    switch @model.get('event')
      when "Policy"
        @speeches = [
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
        ]
      when "Public Forum"
        @speeches = [
          'Aff1',
          'Neg1',
          'Crossfire1',
          'Aff2',
          'Neg2',
          'Crossfile2',
          'Aff3',
          'Neg3',
          'Crossfire3'
        ]
      when 'Lincoln Douglas'
        @speeches = [
          'First Affirmative',
          'Cross Examination 1',
          'First Negation',
          'Cross Examination 2',
          'Second Affirmative',
          'Second Negation',
          'Third Affirmative'
        ]
      else
        @speeches = ['Aff1', 'Neg1', 'Aff2', 'Neg2', 'Aff3', 'Neg3']

  render: ->
    $(@el).html(@template(round: @model, speeches: @speeches))
    for speech in @speeches
      @appendSpeech(speech)
    @

  appendSpeech: (speech) =>
    contentions = new DebateJudge.Collections.Contentions @contentions.filter (contentions) =>
      (contentions.get 'speech_type') == speech
    view = new DebateJudge.Views.ContentionsIndex(collection: contentions, model: @model, speech: speech)
    @$("#speech-area").append(view.render().$el)

  deleteRound: (e) ->
    if confirm "Are you sure you want to delete this round?"
      @model.destroy
        success: (model, response) ->
          page '/tournaments'
        error: (model, response) ->
          alert "Something went wrong"

  toggleTimer: (e) ->
    $('#runner').runner('toggle')

  timerFunction: (value) ->
    @$("#set-timer-input").addClass('hidden')
    @$("#runner").removeClass('hidden')
    @$("#runner").runner
      countdown: true
      startAt: value * 60 * 1000
      stopAt: 0
      milliseconds: false
    .on "runnerFinish", (eventObject, info) ->
      $("#runner").css('color', 'red')
  
  setTimer: ->
    newValue = @$("#set-timer-input input").val()
    @timerFunction(newValue)
    @$('#set-timer').addClass('hidden')
    @$('#reset-timer').removeClass('hidden')

  resetTimer: ->
    @$("#runner").addClass("hidden")
    @$("#set-timer-input").removeClass('hidden')
    @$('#set-timer').removeClass('hidden')
    @$('#reset-timer').addClass('hidden')
    $('#runner').css('color', 'black')