class DebateJudge.Views.UsersNew extends Backbone.View

  template: JST['users/new']
  className: 'container'

  events:
    'submit #new_user': 'addUser'

  initialize: ->
    @listenTo @model, "invalid", @printErrors

  render: ->
    $(@el).html(@template())
    @

  attributes: ->
    name: $('#new_user_name').val()
    email: $('#new_user_email').val()
    password: $('#new_user_password').val()
    password_confirmation: $('#new_user_password_confirmation').val()

  addUser: (e) ->
    e.preventDefault()

    @model.save @attributes(),
      wait: true
      success: (data) ->
        window.location.href = '/tournaments'
      error: (model, response) =>
        errors = $.parseJSON(response.responseText).errors
        @printErrors(@model, errors)

  printErrors: (model, errors) ->
    @$('#error-notice').addClass('alert alert-danger')
    @$('#error-notice').empty()
    
    if _.isArray(errors)
      for error in errors
        @$('#error-notice').append("<p>#{error}</p>")
    else
      for attribute, error of errors
        @$('#error-notice').append("<p>#{attribute} #{item}</p>") for item in error