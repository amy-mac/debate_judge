class DebateJudge.Views.Home extends Backbone.View
  template: JST['home']

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
    e.preventDefault()
    $('#email').val('test@amy-mac.com')
    $('#password').val('foobarbaz')

  clearFields: (e) ->
    e.preventDefault()
    $('#email').val('')
    $('#password').val('')