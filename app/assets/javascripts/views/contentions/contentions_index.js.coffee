class DebateJudge.Views.ContentionsIndex extends Backbone.View
  template: JST['contentions/index']
  className: 'speech'

  events:
    'click .open-composer': 'openForm'
    'click button': 'closeForm'
    'click .new-contention-submit': 'createContention'

  initialize: (opts) ->
    @speech = opts.speech
    @listenTo @collection, 'reset', @render
    @listenTo @collection, 'sync', @render
    @listenTo @collection, 'add', @appendContention
    @listenTo @collection, 'remove', @render

  render: ->
    $(@el).html(@template(speech: @speech))
    $(@el).attr("data-id", "#{@speech}")
    @collection.each(@appendContention, @)
    @

  openForm: (e) ->
    e.preventDefault()
    @$('.contention-composer').removeClass('hidden')

  closeForm: (e) ->
    @$('.contention-composer').addClass('hidden')

  createContention: (e) ->
    e.preventDefault()
    contention = @$(".new-contention").val()
    @collection.create speech_type: @speech, contention: contention, round_id: @model.id
    @$('textarea').val('')

  appendContention: (contention) ->
    view = new DebateJudge.Views.Contention(model: contention)
    @$('.contentions').append(view.render().$el)