class DebateJudge.Views.Contention extends Backbone.View
  template: JST['contentions/show']
  className: 'contention'

  events:
    'click .glyphicon-remove': 'deleteContention'
    'click .glyphicon-pencil': 'openEditor'
    'click .glyphicon-thumbs-down': 'refuteContention'
    'click .contention-editor button': 'closeEditor'
    'click #edit-contention-submit': 'editContention'

  initialize: ->
    @model.on 'reset', @render, @
    @model.on 'sync', @render, @

  render: ->
    $(@el).html(@template(contention: @model))
    $(@el).attr("data-id", @model.id)
    @

  deleteContention: (e) ->
    if confirm "Are you sure you want to delete this?"
      @model.destroy()

  openEditor: (e) ->
    e.preventDefault()
    @$('.hide-on-edit').addClass('hidden')
    @$('.contention-editor').removeClass('hidden')
    @$('.contention-editor textarea').val(@model.get('contention'))

  closeEditor: (e) ->
    @$('.hide-on-edit').removeClass('hidden')
    @$('.contention-editor').addClass('hidden')

  editContention: (e) ->
    e.preventDefault()
    @model.editContention(@$('.contention-editor textarea').val())

  refuteContention: (e) ->
    e.preventDefault()
    @model.refuteContention()