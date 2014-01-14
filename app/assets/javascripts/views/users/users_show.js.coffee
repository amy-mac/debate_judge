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
    
    @model.save attributes,
      validate: false
      wait: true
      success: ->
        @$('#error-notice').addClass('alert alert-success')
        @$('#error-notice').empty().html("Your profile has been updated successfully")
      error: (model, response) =>
        @printErrors(@model, response)

  printErrors: (model, errors) ->
    @$('#error-notice').addClass('alert alert-danger')
    @$('#error-notice').empty()

    for attribute, error of errors
      @$('#error-notice').append("<p>#{attribute} #{item}</p>") for item in error