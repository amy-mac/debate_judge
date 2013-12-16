class DebateJudge.Views.Round extends Backbone.View
  template: JST['rounds/round']

  initialize: ->
    @model.on('reset', @render, this)
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
    contentions = new DebateJudge.Collections.Contentions @collection.filter (contentions) =>
      (contention.get 'speech_type') == speech
    view = new DebateJudge.Views.ContentionsIndex(collection: contentions, model: @model, speech: speech)
    @$("#speech-area").append(view.render().$el)