class DebateJudge.Views.UsersShow extends Backbone.View
  template: JST['users/show']
  className: 'container'

  initialize: ->
    @model.on('reset', @render, this)

  render: ->
    $(@el).html(@template(user: @model))
    @
