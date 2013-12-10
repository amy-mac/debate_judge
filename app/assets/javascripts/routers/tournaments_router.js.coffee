class DebateJudge.Routers.Tournaments extends Backbone.Router
  routes:
    '': 'index'
    'tournaments/:id': 'show'
    'users/:id': 'userShow'
    'users/new': 'userNew'
    'users/create': 'create'
    'users/edit': 'edit'

  initialize: ->
    @collection = new DebateJudge.Collections.Tournaments()
    @collection.fetch()
  
  index: ->
    view = new DebateJudge.Views.TournamentsIndex(collection: @collection)
    $('#main').html(view.render().el)

  show: (id) ->
    alert "show page"

  userNew: ->
    alert "Test"
    view = new DebateJudge.Views.UsersNew()
    $('#main').html(view.render().el)