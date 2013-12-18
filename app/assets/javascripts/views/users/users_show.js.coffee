class DebateJudge.Views.UsersShow extends Backbone.View
  template: JST['users/show']
  className: 'container'

  events:
    'submit #editInfo': 'editInfo'

  initialize: ->
    @model.on('reset', @render, this)

  render: ->
    $(@el).html(@template(user: @model))
    @

  editInfo: (e) ->
    e.preventDefault()
    attributes =
      name: $('#editInfo_name').val()
      email: $('#editInfo_email').val()
      password: $('#enterPassword').val()
    @model.editInfo(attributes)