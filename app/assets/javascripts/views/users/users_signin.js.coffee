class DebateJudge.Views.UsersSignIn extends Backbone.View
  template: JST['users/signin']
  className: 'modal-body'

  events:
    'submit #new_session': 'newSession'

  render: ->
    $('#myModalLabel').html("Sign In")
    $(@el).html(@template())
    @

  newSession: (e) ->
    e.preventDefault()

    $.ajax '/sessions',
      type: 'POST'
      data:
        email: @$('#new_session_email').val()
        password: @$('#new_session_pass').val()
      error: (data) =>
        @printErrors()
      success: (data, textStatus, jqXHR) ->
        window.location.href = '/tournaments'

  printErrors: ->
    @$('#error-notice').addClass('alert alert-danger')
    @$('#error-notice').empty().html('Password/Email combination does not exist')