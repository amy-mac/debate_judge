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
  $('#round_page').empty()
  @collection = new DebateJudge.Collections.Tournaments()
  @rounds = new DebateJudge.Collections.Rounds()
  @rounds.fetch()
  @collection.fetch()
  view = new DebateJudge.Views.TournamentsIndex(collection: @collection, rounds: @rounds)
  $('#main').html(view.render().el)

page '/rounds/:id', (ctx) ->
  @contentions = new DebateJudge.Collections.Contentions()
  @contentions = new DebateJudge.Collections.Contentions @contentions.where round_id: ctx.params.id
  @model = new DebateJudge.Models.Round id: ctx.params.id
  @contentions.fetch()
  @model.fetch().then =>
    view = new DebateJudge.Views.Round(model: @model, collection: @contentions)
    $('#main').empty()
    $('#round_page').html(view.render().el)

page '/users/new', ->
  $('#round_page').empty()
  view = new DebateJudge.Views.UsersNew()
  $('#main').html(view.render().el)

page '/users/:id', ->
  $('#round_page').empty()
  @model = new DebateJudge.Models.User id: gon.currentUser.id
  @model.fetch().then =>
    view = new DebateJudge.Views.UsersShow(model: @model)
    $('#main').html(view.render().el)