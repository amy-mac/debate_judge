class DebateJudge.Views.Navbar extends Backbone.View

  template: JST['navbar']
  className: 'container'

  events:
    'click #sign_up_link': 'signUpPage'
    'click .navbar-brand': 'indexPage'

  render: ->
    $(@el).html(@template())
    @

  indexPage: (e) ->
    e.preventDefault()
    page '/'

  signUpPage: (e) ->
    e.preventDefault()
    page '/users/new'
