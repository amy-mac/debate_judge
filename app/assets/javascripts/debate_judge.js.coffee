window.DebateJudge =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new DebateJudge.Routers.Tournaments
    Backbone.history.start()

$(document).ready ->
  DebateJudge.initialize()
