class DebateJudge.Views.Tournament extends Backbone.View
  template: JST['tournaments/tournament']
  tagName: 'a'
  className: 'list-group-item'

  render: ->
    $(@el).html(@template(tournament: @model))
    @