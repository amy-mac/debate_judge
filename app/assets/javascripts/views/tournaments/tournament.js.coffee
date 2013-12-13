class DebateJudge.Views.Tournament extends Backbone.View
  template: JST['tournaments/tournament']
  tagName: 'a'
  className: 'list-group-item'

  events:
    "click": "unhideRounds"

  render: ->
    $(@el).html(@template(tournament: @model))
    view = new DebateJudge.Views.RoundsIndex(collection: @collection)
    $(@el).find('div').html(view.render().el)
    @

  unhideRounds: ->
    $(@el).find('div').toggleClass('hidden')