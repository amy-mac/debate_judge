class DebateJudge.Views.Tournament extends Backbone.View
  template: JST['tournaments/tournament']
  className: 'panel panel-default'

  events:
    "click .panel-heading": 'unhideRounds'
    "click .new_round_num": (e) -> e.preventDefault()

  render: ->
    $(@el).html(@template(tournament: @model, rounds: @collection))
    $(@el).attr("href", "#")
    view = new DebateJudge.Views.RoundsIndex(collection: @collection, tournament: @model)
    $(@el).append(view.render().el)
    @

  unhideRounds: (e) ->
    e.preventDefault()
    @$(".rounds").toggleClass('hidden')

  deleteTournament: ->
    @model.destroy()