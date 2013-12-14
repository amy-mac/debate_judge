window.DebateJudge =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    page()
    nav = new DebateJudge.Views.Navbar()
    $('#navbar').html(nav.render().el)

$(document).ready ->
  DebateJudge.initialize()


page '/', ->
  @collection = new DebateJudge.Collections.Tournaments()
  @rounds = new DebateJudge.Collections.Rounds()
  @rounds.fetch()
  @collection.fetch()
  view = new DebateJudge.Views.TournamentsIndex(collection: @collection, rounds: @rounds)
  $('#main').html(view.render().el)

page '/rounds/:id', ->
  view = new DebateJudge.Views.Round()
  $('#main').empty()
  $('#round_page').html(view.render().el)

page '/users/new', ->
  view = new DebateJudge.Views.UsersNew()
  $('#main').html(view.render().el)

page '/users/:id', ->
  @model = new DebateJudge.Models.User id: gon.currentUser.id
  @model.fetch().then =>
    view = new DebateJudge.Views.UsersShow(model: @model)
    $('#main').html(view.render().el)
