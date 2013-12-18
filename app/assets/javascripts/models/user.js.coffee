class DebateJudge.Models.User extends Backbone.Model
  urlRoot: '/api/users'
  paramRoot: 'user'

  editInfo: (attrs) ->
    @save attrs