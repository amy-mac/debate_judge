class DebateJudge.Views.RoundsRecent extends Backbone.View
  template: JST['rounds/recent']
  tagName: 'ul'

  initialize: ->
    @listenTo @collection, 'sort', @render

  render: ->
    @filterRounds()
    @$el.html(@template(recent: @recent))
    @

  filterRounds: ->
    @recent = new DebateJudge.Collections.Rounds @collection.last(5)
    @recent.comparator = 'updated_at'