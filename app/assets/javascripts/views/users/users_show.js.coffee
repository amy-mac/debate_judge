class DebateJudge.Views.UsersShow extends Backbone.View
  template: JST['users/show']
  className: 'row'

  initialize: ->
    @model.on('reset', @render, this)

  render: ->
    $(@el).html(@template(user: @model))
    @
