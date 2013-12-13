class DebateJudge.Views.Tournament extends Backbone.View
  template: JST['tournaments/tournament']
  tagName: 'a'
  className: 'list-group-item'

  events:
    "click .list-group-item-heading": "unhideRounds"

  render: ->
    $(@el).html(@template(tournament: @model, rounds: @collection))
    if @collection.length isnt 0
      view = new DebateJudge.Views.RoundsIndex(collection: @collection)
      # $(@el).find('div').html(view.render().el)
      $(@el).append(view.render().el)
    else
      # $(@el).find('div').html("<p>No rounds added yet</p>")
      $(@el).append("<div id='rounds' class='hidden, text-muted'>No rounds added yet</div>")
    @

  unhideRounds: ->
    # $(@el).toggleClass('active')
    $(@el).find("#rounds").toggleClass('hidden')