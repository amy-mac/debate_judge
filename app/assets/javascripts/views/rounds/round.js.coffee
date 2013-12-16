class DebateJudge.Views.Round extends Backbone.View
  template: JST['rounds/round']

  initialize: ->
    @model.on('reset', @render, this)
    switch @model.get('event')
      when "Policy"
        @event = [
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
        @event = [
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
        @event = [
          'First Affirmative',
          'Cross Examination 1',
          'First Negation',
          'Cross Examination 2',
          'Second Affirmative',
          'Second Negation',
          'Third Affirmative'
        ]
      else
        @event = ['Aff1', 'Neg1', 'Aff2', 'Neg2', 'Aff3', 'Neg3']


  render: ->
    $(@el).html(@template(round: @model, event: @event))
    @