class DebateJudge.Models.Contention extends Backbone.Model
  urlRoot: '/api/contentions'
  paramRoot: 'contention'

  editContention: (value) ->
    @save contention: value

  refuteContention: ->
    @save refuted: true