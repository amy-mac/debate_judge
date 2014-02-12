class DebateJudge.Views.TournamentsIndex extends Backbone.View

  template: JST['tournaments/index']
  className: 'container'

  events:
    'submit #new_tourney': 'createTournament'
    'click #tourney_add': 'openForm'

  initialize: (opts) ->
    @listenTo @collection, 'sort', @render
    @listenTo @collection, 'remove', @render
    @rounds = opts.rounds

  render: ->
    $(@el).html(@template)
    @collection.each(@appendTournament, @)
    @recentRounds()
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
    @$('#tournaments').append(view.render().el)

  openForm: (e) ->
    e.preventDefault()
    $('#new_tourney').toggleClass('hidden')

  # Creates a view for the recent rounds
  recentRounds: ->
    view2 = new DebateJudge.Views.RoundsRecent(collection: @rounds)
    view2.comparator = 'updated_at'
    @$('aside').append(view2.render().el)
