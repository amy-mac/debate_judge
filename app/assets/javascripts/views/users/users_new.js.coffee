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
    # name = $('#new_user_name').val()
    # email = $('#new_user_email').val()
    # password = $('#new_user_password').val()
    # password_confirmation = $('#new_user_password').val()

    # if (this.submitButton.hasClass('disabled') && this.form.data('user-created') !== true) {
    #   return false;
    # } else {
    #   this.submitButton.addClass('disabled');
    # }

    user = new DebateJudge.Models.User @attributes()
    user.save null,
      success: (data) ->
        console.log(data)