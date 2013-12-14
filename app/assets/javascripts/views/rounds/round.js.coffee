class DebateJudge.Views.Round extends Backbone.View
  template: JST['rounds/parli']

  render: ->
    $(@el).html(@template())
    @