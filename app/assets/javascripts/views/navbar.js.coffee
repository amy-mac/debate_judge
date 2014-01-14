class DebateJudge.Views.Navbar extends Backbone.View

  template: JST['navbar']
  className: 'container'

  events:
    'click #sign_up_link': 'signUpPage'
    'click .navbar-brand': 'indexPage'
    'click #sign_in_link': 'showSignIn'
    'click #signOut': 'deleteSession'
    'click #editAccount': 'editUser'
    'click #myTournaments': 'tournamentsPage'

  # initialize: ->
  #   if @collection?
  #     _.each ['add', 'remove', 'change', 'reset'], (event) =>
  #       @listenTo @collection, event, =>
  #         @render()

  render: ->
    # if @collection?
    #   @recentRounds()
    $(@el).html(@template(navRecent: @recent))
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

  tournamentsPage: (e) ->
    e.preventDefault()
    page "/tournaments"

  recentRounds: ->
    @collection.updatedRounds()
    @recent = new DebateJudge.Collections.Rounds @collection.last(5)
    @recent.updatedRounds()

  showSignIn: ->
    view = new DebateJudge.Views.UsersSignIn()
    $('.modal-body').html(view.render().el)