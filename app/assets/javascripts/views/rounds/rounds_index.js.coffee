class DebateJudge.Views.RoundsIndex extends Backbone.View
  template: JST['rounds/index']
  className: 'list-group-text'
  id: "rounds"

  events:
    'submit #new_round': 'addRound'
    'click #delete_tourney': 'deleteTournament'
    'click .test': 'openRound'

  initialize: (opts) ->
    @tournament = opts.tournament
    @lincoln = new DebateJudge.Collections.Rounds @collection.where event: "Lincoln Douglas"
    @parli = new DebateJudge.Collections.Rounds @collection.where event: "Parli"
    @policy = new DebateJudge.Collections.Rounds @collection.where event: "Policy"
    @public = new DebateJudge.Collections.Rounds @collection.where event: "Public Forum"

  render: ->
    $(@el).html(@template(lincoln: @lincoln, parli: @parli, policy: @policy, public: @public, collection: @collection))
    @

  addRound: (e) ->
    e.preventDefault()
    event_type = $(e.currentTarget).parent().find("#new_round_event").val()
    round_num = $(e.currentTarget).parent().find("#new_round_num").val()
    @collection.create tournament_id: @tournament, event: event_type, round_num: round_num 
    $('#new_round_num').val('')
    $('#new_round_event').val('')

  deleteTournament: (e) ->
    @tournament.destroy()

  openRound: (e) ->
    console.log "I'm working"
    round_id = $(e.currentTarget).data('id')
    page "/rounds/#{round_id}"