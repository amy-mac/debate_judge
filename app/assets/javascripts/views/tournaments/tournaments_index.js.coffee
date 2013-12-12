class DebateJudge.Views.TournamentsIndex extends Backbone.View

  template: JST['tournaments/index']
  className: 'row'

  events:
    'submit #new_tourney': 'createTournament'
    'click #tourney_add': 'openForm'

  initialize: (opts) ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTournament, this)
    @rounds = opts.rounds

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTournament)
    @

  attributes: ->
    tournament: $('#new_tourney_tournament').val()
    school: $('#new_tourney_school').val()
    date: $('#new_tourney_date').val()

  createTournament: (e) ->
    e.preventDefault()
    @collection.create @attributes()
    $('#new_tourney').addClass('hidden')
    $('#new_tourney_tournament').val('')
    $('#new_tourney_school').val('')
    $('#new_tourney_date').val('')

  appendTournament: (tourney) =>
    rounds = new DebateJudge.Collections.Rounds @rounds.filter (round) =>
      (round.get 'tournament_id') == tourney.id
    view = new DebateJudge.Views.Tournament(model: tourney, collection: rounds)
    $('#tournaments').append(view.render().el)

  openForm: (e) ->
    $('#new_tourney').toggleClass('hidden')
