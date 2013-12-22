class DebateJudge.Views.UsersNew extends Backbone.View

  template: JST['users/new']
  className: 'container'

  events:
    'submit #new_user': 'addUser'

  render: ->
    $(@el).html(@template())
    @

  attributes: ->
    name: $('#new_user_name').val()
    email: $('#new_user_email').val()
    password: $('#new_user_password').val()
    password_confirmation: $('#new_user_password').val()

  addUser: (e) ->
    e.preventDefault()

    user = new DebateJudge.Models.User @attributes()
    user.save null,
      wait: true
      success: (data) ->
        window.location.href = '/tournaments'
      error: ->
        alert "Oops, something went wrong!"