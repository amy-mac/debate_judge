class DebateJudge.Views.Round extends Backbone.View
  template: JST['rounds/parli']

  initialize: ->
    @model.on('reset', @render, this)

  render: ->
    $(@el).html(@template(round: @model))
    @