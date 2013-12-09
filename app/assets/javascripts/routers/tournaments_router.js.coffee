class DebateJudge.Routers.Tournaments extends Backbone.Router
  routes:
    '': 'index'
    'tournaments/:id': 'show'

  initialize: ->
    @collection = new DebateJudge.Collections.Tournaments()
    window.tournaments = @collection

  index: ->
    @collection.fetch().done =>
      view = new DebateJudge.Views.TournamentsIndex(collection: @collection)
      $('#container').html(view.render().el)

  show: (id) ->
    alert "show page"