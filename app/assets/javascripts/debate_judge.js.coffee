window.DebateJudge =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    page()

    nav = new DebateJudge.Views.Navbar()
    $('#navbar').html(nav.render().el)

    if not gon.currentUser
      page '/'

$(document).ready ->
  DebateJudge.initialize()

page '/', ->
  if gon.currentUser?
    page '/tournaments'
  else
    $('#round_page').empty()
    view = new DebateJudge.Views.Home()
    .render()

page '/tournaments', ->
  $('#round_page').empty()
  @collection = new DebateJudge.Collections.Tournaments()
  @rounds = new DebateJudge.Collections.Rounds()
  @rounds.fetch().then =>
    @collection.fetch().then =>
      view = new DebateJudge.Views.TournamentsIndex(collection: @collection, rounds: @rounds)
      $('#main').html(view.render().el)

page '/rounds/:id', (ctx) ->
  @userContentions = new DebateJudge.Collections.Contentions()
  @model = new DebateJudge.Models.Round id: ctx.params.id
  @userContentions.fetch().then =>
    @model.fetch().then =>
      view = new DebateJudge.Views.Round(model: @model, collection: @userContentions)
      $('#main').empty()
      $('#round_page').html(view.render().el)

page '/users/new', ->
  $('#round_page').empty()
  @model = new DebateJudge.Models.User()
  view = new DebateJudge.Views.UsersNew(model: @model)
  $('#main').html(view.render().el)

page '/users/:id', ->
  $('#round_page').empty()
  @model = new DebateJudge.Models.User id: gon.currentUser.id
  @model.fetch().then =>
    view = new DebateJudge.Views.UsersShow(model: @model)
    $('#main').html(view.render().el)