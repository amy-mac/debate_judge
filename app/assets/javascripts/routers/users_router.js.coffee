class DebateJudge.Routers.Users extends Backbone.Router
  routes:
    'users/:id': 'show'
    'users/new': 'new'
    'users/create': 'create'
    'users/edit': 'edit'

  show: (id) ->
