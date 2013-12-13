class DebateJudge.Views.RoundsIndex extends Backbone.View
  template: JST['rounds/index']
  className: 'list-group-text, hidden'
  id: "rounds"

  initialize: ->
    @lincoln = new DebateJudge.Collections.Rounds @collection.where event: "Lincoln Douglas"
    @parli = new DebateJudge.Collections.Rounds @collection.where event: "Parli"
    @policy = new DebateJudge.Collections.Rounds @collection.where event: "Policy"
    @public = new DebateJudge.Collections.Rounds @collection.where event: "Public Forum"

  render: ->
    $(@el).html(@template(lincoln: @lincoln, parli: @parli, policy: @policy, public: @public))
    @

  openForm: (e) ->
    $('#new_round').toggleClass('hidden')