class DebateJudge.Views.RoundsIndex extends Backbone.View
  template: JST['rounds/index']
  className: 'rounds panel-body hidden'

  events:
    'click .roundAdd': 'openForm'
    'submit .new_round': 'addRound'
    'click .delete_tourney': 'deleteTournament'
    'click .open-round': 'openRound'

  initialize: (opts) ->
    @tournament = opts.tournament
    @listenTo @collection, 'sort', @render

  render: ->
    @filterEvents()
    @$el.html(@template(lincoln: @lincoln, parli: @parli, policy: @policy, public: @public, collection: @collection))
    @

  filterEvents: ->
    @lincoln = new DebateJudge.Collections.Rounds @collection.where event: "Lincoln Douglas"
    @parli = new DebateJudge.Collections.Rounds @collection.where event: "Parli"
    @policy = new DebateJudge.Collections.Rounds @collection.where event: "Policy"
    @public = new DebateJudge.Collections.Rounds @collection.where event: "Public Forum"

  addRound: (e) ->
    e.preventDefault()
    event_type = @$('.new_round_event').val()
    round_num = @$('.new_round_num').val()
    
    @collection.create {
      tournament_id: @tournament.id
      event: event_type
      round_num: round_num
    }, {
      wait: true
      success: (model, response) ->
        page "/rounds/#{response.id}"
      error: (response) =>
        alert "That round already exists"
    }

  deleteTournament: (e) ->
    @tournament.destroy()

  openRound: (e) ->
    e.preventDefault()
    round_id = $(e.currentTarget).data('id')
    page "/rounds/#{round_id}", round_id

  openForm: (e) ->
    e.preventDefault()
    @$('.new_round').removeClass('hidden')