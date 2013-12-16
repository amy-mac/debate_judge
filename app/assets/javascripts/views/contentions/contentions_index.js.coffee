class DebateJudge.Views.ContentionsIndex extends Backbone.View
  template: JST['contentions/index']
  className: 'speech'

  initialize: (opts) ->
    @speech = opts.speech

  render: ->
    $(@el).html(@template(speech: @speech))
    $(@el).attr("data-id", "#{@speech}")
    @