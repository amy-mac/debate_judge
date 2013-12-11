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
  @collection.fetch()
  view = new DebateJudge.Views.TournamentsIndex(collection: @collection)
  $('#main').html(view.render().el)

# page '/tournaments/:id' ->
#   alert "show page"

page '/users/new', ->
  view = new DebateJudge.Views.UsersNew()
  $('#main').html(view.render().el)

# page 'users/:id' ->
#   alert "user id"

# page 'users/create' ->
#   alert "user create"
    
# page 'users/edit' ->
#   alert "user edit"