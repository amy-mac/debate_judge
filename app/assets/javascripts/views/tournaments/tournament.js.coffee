class DebateJudge.Views.Tournament extends Backbone.View
  template: JST['tournaments/tournament']
  tagName: 'a'
  className: 'list-group-item'

  events:
    "click .list-group-item-heading": "unhideRounds"

  initialize: ->
    # @collection.on('sync', @render, this)
    @collection.on('sort', @render, this)

  render: ->
    $(@el).html(@template(tournament: @model, rounds: @collection))
    $(@el).attr("href", "#")
    view = new DebateJudge.Views.RoundsIndex(collection: @collection, tournament: @model)
    $(@el).append(view.render().el)
    @

  unhideRounds: (e) ->
    e.preventDefault()
    @$("#rounds").toggleClass('hidden')

  deleteTournament: ->
    @model.destroy()