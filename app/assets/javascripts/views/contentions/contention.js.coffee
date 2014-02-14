class DebateJudge.Views.Contention extends Backbone.View
  template: JST['contentions/show']
  className: 'contention'

  events:
    'click .glyphicon-remove': 'confirmDelete'
    'click .glyphicon-pencil': 'openEditor'
    'click .refute': 'refuteContention'
    'click .contention-editor button': 'closeEditor'
    'click .edit-contention-submit': 'editContention'
    'keypress .edit-contention': 'createEnter'

  initialize: ->
    @model.on 'reset', @render, @
    @model.on 'sync', @render, @

  render: ->
    $(@el).html(@template(contention: @model))
    $(@el).attr("data-id", @model.id)
    @applyMarkdown(@model.get('contention'))
    @

  confirmDelete: (e) ->
    e.stopPropagation()
    $('.modal-dialog').addClass('modal-sm')
    $('.modal-content').html(JST['confirm_delete'])
    $('#myModal').modal('show')
    $('.modal-footer .btn-primary').on 'click', =>
      $('#myModal').modal('hide')
      @deleteContention()

  deleteContention: ->
    @model.destroy()

  openEditor: (e) ->
    e.preventDefault()
    @$('.hide-on-edit').addClass('hidden')
    @$('.contention-editor').removeClass('hidden')
    @$('.contention-editor textarea').val(@model.get('contention'))
    @$('.edit-contention').focus()

  closeEditor: (e) ->
    @$('.hide-on-edit').removeClass('hidden')
    @$('.contention-editor').addClass('hidden')

  createEnter: (e) ->
    if e.which is 13 and not e.shiftKey
      @editContention(e)

  editContention: (e) ->
    e.preventDefault()
    @model.editContention(@$('.contention-editor textarea').val())

  refuteContention: (e) ->
    e.preventDefault()
    @model.refuteContention()

  applyMarkdown: (value) ->
    @$('.markdown').html(markdown.toHTML(value))