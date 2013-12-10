class DebateJudge.Views.Tournament extends Backbone.View
  template: JST['tournaments/tournament']
  tagName: 'li'

  render: ->
    $(@el).html(@template(tournament: @model))
    @