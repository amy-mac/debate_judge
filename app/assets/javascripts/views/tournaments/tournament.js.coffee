class DebateJudge.Views.Tournament extends Backbone.View
  template: JST['tournaments/tournament']
  tagName: 'a'
  className: 'list-group-item'

  events:
    "click": "unhideRounds"

  render: ->
    $(@el).html(@template(tournament: @model, rounds: @collection))
    if @collection.length != 0
      view = new DebateJudge.Views.RoundsIndex(collection: @collection)
      $(@el).find('div').html(view.render().el)
    else
      $(@el).find('div').html("<p>No rounds added yet</p>")
    @

  unhideRounds: ->
    # $(@el).toggleClass('active')
    $(@el).find('div').toggleClass('hidden')