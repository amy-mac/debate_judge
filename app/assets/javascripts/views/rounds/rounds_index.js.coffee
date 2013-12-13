class DebateJudge.Views.RoundsIndex extends Backbone.View
  template: JST['rounds/index']
  className: 'list-group-text, hidden'
  id: "rounds"

  events:
    'submit #new_round': 'addRound'

  initialize: (opts) ->
    @tournament = opts.tournament
    @lincoln = new DebateJudge.Collections.Rounds @collection.where event: "Lincoln Douglas"
    @parli = new DebateJudge.Collections.Rounds @collection.where event: "Parli"
    @policy = new DebateJudge.Collections.Rounds @collection.where event: "Policy"
    @public = new DebateJudge.Collections.Rounds @collection.where event: "Public Forum"

  render: ->
    $(@el).html(@template(lincoln: @lincoln, parli: @parli, policy: @policy, public: @public))
    @

  addRound: (e) ->
    e.preventDefault()
    @collection.create tournament_id: @tournament, event: $("#new_round_event").val(), round_num: $("#new_round_num").val()
    $('#new_round_num').val('')
    $('#new_round_event').val('')