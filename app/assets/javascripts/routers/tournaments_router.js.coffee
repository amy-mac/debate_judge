class DebateJudge.Routers.Tournaments extends Backbone.Router
  routes:
    '': 'index'
    'tournaments/:id': 'show'

  initialize: ->
    @collection = new DebateJudge.Collections.Tournaments()
    @collection.fetch()
  
  index: ->
    view = new DebateJudge.Views.TournamentsIndex(collection: @collection)
    $('#main').html(view.render().el)

  show: (id) ->
    alert "show page"