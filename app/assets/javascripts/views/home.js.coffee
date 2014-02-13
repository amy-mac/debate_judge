class DebateJudge.Views.Home extends Backbone.View
  template: JST['home']
  el: '#main'

  events:
    'click .sign_up_link': 'signUpPage'
    'click .try_demo': 'tryDemo'
    'click #myModal > .cancel': 'clearFields'

  render: ->
    $(@el).html(@template())
    @

  signUpPage: (e) ->
    e.preventDefault()
    page '/users/new'

  tryDemo: (e) ->
    view = new DebateJudge.Views.UsersSignIn()
    $('.modal-body').html(view.render().el)
    $('#new_session_email').val('test@amy-mac.com')
    $('#new_session_pass').val('foobarbaz')
    $('#myModal').modal('show')