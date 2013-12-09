class DebateJudge.Views.TournamentsIndex extends Backbone.View

  template: JST['tournaments/index']

  events:
    'submit #new_tourney': 'createTournament'

  initialize: ->
    @collection.on('add', @render, this)

  render: ->
    $(@el).html(@template(tournaments: @collection))
    @

  createTournament: (e) ->
    e.preventDefault()
    tournament = $('#new_tourney_tournament').val()
    school = $('#new_tourney_school').val()
    date = $('#new_tourney_date').val()
    @collection.create tournament: tournament, school: school, date: date