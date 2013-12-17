class DebateJudge.Views.Contention extends Backbone.View
  template: JST['contentions/show']
  className: 'contention'

  events:
    'click .glyphicon-remove': 'deleteContention'

  initialize: ->
    @model.on 'reset', @render, this

  render: ->
    $(@el).html(@template(contention: @model))
    @

  deleteContention: (e) ->
    if confirm "Are you sure you want to delete this?"
      @model.destroy()