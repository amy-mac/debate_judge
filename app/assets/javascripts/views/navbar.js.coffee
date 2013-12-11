class DebateJudge.Views.Navbar extends Backbone.View

  template: JST['navbar']
  className: 'container'

  events:
    'click #sign_up_link': 'signUpPage'
    'click .navbar-brand': 'indexPage'
    'click #signOut': 'deleteSession'
    'click #editAccount': 'editUser'

  render: ->
    $(@el).html(@template())
    @

  indexPage: (e) ->
    e.preventDefault()
    page '/'

  signUpPage: (e) ->
    e.preventDefault()
    page '/users/new'

  deleteSession: (e) ->
    e.preventDefault()
    req = $.ajax
      url: "/sessions/destroy"
      method: 'post'
    .done ->
      window.location.href = '/'

  editUser: (e) ->
    e.preventDefault()
    page "/users/#{gon.currentUser.id}"