window.DebateJudge =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    Backbone.history.start({pushState: true})
    @collection = new DebateJudge.Collections.Tournaments()
    @collection.fetch()

$(document).ready ->
  DebateJudge.initialize()


page '/' ->
  view = new DebateJudge.Views.TournamentsIndex(collection: @collection)
  $('#main').html(view.render().el)

page '/tournaments/:id' ->
    alert "show page"

page '/users/new', ->
  view = new DebateJudge.Views.UsersNew()
  $('#main').html(view.render().el)

page 'users/:id' ->

page 'users/create' ->
    
page 'users/edit' ->