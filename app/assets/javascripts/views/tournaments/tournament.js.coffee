class DebateJudge.Views.Tournament extends Backbone.View
  template: JST['tournaments/tournament']
  tagName: 'a'
  className: 'list-group-item'

  events:
    "click .list-group-item-heading": "unhideRounds"

  initialize: ->
    @collection.on('add', @render, this)
    @collection.on('reset', @render, this)


  render: ->
    $(@el).html(@template(tournament: @model, rounds: @collection))
    $(@el).attr("href", "#")
    if @collection.length isnt 0
      view = new DebateJudge.Views.RoundsIndex(collection: @collection, tournament: @model.id)
      $(@el).append(view.render().el)
    else
      $(@el).append("<div id='rounds' class='hidden text-muted'>No rounds added yet</div>")
    @

  unhideRounds: ->
    # $(@el).toggleClass('active')
    $(@el).find("#rounds").toggleClass('hidden')