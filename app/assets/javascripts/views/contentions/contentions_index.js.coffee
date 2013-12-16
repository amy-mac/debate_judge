class DebateJudge.Views.ContentionsIndex extends Backbone.View
  template: JST['contentions/index']
  className: 'speech'

  events:
    'click .open-composer': 'openForm'
    'click button': 'closeForm'
    'submit .contention-composer': 'addContention'

  initialize: (opts) ->
    @speech = opts.speech

  render: ->
    $(@el).html(@template(speech: @speech))
    $(@el).attr("data-id", "#{@speech}")
    @

  openForm: (e) ->
    @$('.contention-composer').removeClass('hidden')

  closeForm: (e) ->
    @$('.contention-composer').addClass('hidden')

  addContention: (e) ->
    e.preventDefault()
    contention = @$("textarea").val()
    @collection.create contention: contention
    $('textarea').val('')