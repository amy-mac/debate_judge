class DebateJudge.Views.Contention extends Backbone.View
  template: JST['contentions/show']
  className: 'contention'

  initialize: ->
    @model.on 'reset', @render, this

  render: ->
    $(@el).html(@template(contention: @model))
    @