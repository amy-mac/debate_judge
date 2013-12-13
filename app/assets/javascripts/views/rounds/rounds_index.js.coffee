class DebateJudge.Views.RoundsIndex extends Backbone.View
  template: JST['rounds/index']
  tagName: 'ul'

  render: ->
    $(@el).html(@template(rounds: @collection))
    @