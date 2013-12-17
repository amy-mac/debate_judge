class DebateJudge.Views.Home extends Backbone.View
  template: JST['home']
  className: 'container'

  render: ->
    $(@el).html(@template())
    @