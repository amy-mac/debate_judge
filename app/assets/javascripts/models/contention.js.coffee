class DebateJudge.Models.Contention extends Backbone.Model
  urlRoot: '/api/contentions'
  paramRoot: 'contention'

  editContention: (value) ->
    @save contention: value

  refuteContention: ->
    if @get('refuted') == false
      @save refuted: true
    else
      @save refuted: false