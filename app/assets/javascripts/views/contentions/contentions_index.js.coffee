class DebateJudge.Views.ContentionsIndex extends Backbone.View
  template: JST['contentions/index']
  className: 'speech'

  events:
    'click .open-composer': 'openForm'
    'click button': 'closeForm'
    'click .new-contention-submit': 'createContention'
    'keypress .new-contention': 'createEnter'

  initialize: (opts) ->
    @speech = opts.speech
    @listenTo @collection, 'reset', @render
    @listenTo @collection, 'add', @appendContention

  render: ->
    $(@el).html(@template(speech: @speech))
    $(@el).attr("data-id", "#{@speech}")
    @collection.each(@appendContention, @)
    @

  openForm: (e) ->
    e.preventDefault()
    @$('.contention-composer').removeClass('hidden')
    @$('.new-contention').focus()
    @$('.open-composer').addClass('hidden')

  closeForm: (e) ->
    @$('.contention-composer').addClass('hidden')
    @$('.open-composer').removeClass('hidden')

  createEnter: (e) ->
    if e.which is 13 and not e.shiftKey
      @createContention(e)

  createContention: (e) ->
    e.preventDefault()
    contention = @$(".new-contention").val()
    @collection.create speech_type: @speech, contention: contention, round_id: @model.id
    @$('textarea').val('')
    @scrollToBottom()

  appendContention: (contention) ->
    view = new DebateJudge.Views.Contention(model: contention)
    @$('.contentions').append(view.render().$el)

  scrollToBottom: ->
    $test = @$('.speech-contentions')
    $test.scrollTop($test.prop('scrollHeight'))