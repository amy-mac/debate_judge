DebateJudge.Views.Contention = Backbone.View.extend({
  template: JST['contentions/show'],
  className: 'contention',

  events: {
    'click .glyphicon-remove':          'confirmDelete',
    'click .glyphicon-pencil':          'openEditor',
    'click .refute':                    'refuteContention',
    'click .contention-editor button':  'closeEditor',
    'click .edit-contention-submit':    'editContention',
    'keypress .edit-contention':        'createEnter'
  },

  initialize: function() {
    // TODO: Change to listenTo
    this.model.on('reset', this.render, this);
    this.model.on('sync', this.render, this);
  },

  render: function() {
    $(this.el).html(this.template({contention: this.model}));
    $(this.el).attr("data-id", this.model.id);
    this.applyMarkdown(this.model.get('contention'));
    return this;
  },

  confirmDelete: function(e) {
    e.stopPropagation();
    var self = this;
    $('.modal-dialog').addClass('modal-sm');
    $('.modal-content').html(JST['confirm_delete']);
    $('#myModal').modal('show');
    $('.modal-footer .btn-danger').on('click', function(e) {
      $('#myModal').modal('hide');
      self.deleteContention();
    });
  },

  deleteContention: function() {
    this.model.destroy();
  },

  openEditor: function(e) {
    e.preventDefault();
    this.$('.hide-on-edit').addClass('hidden');
    this.$('.contention-editor').removeClass('hidden');
    this.$('.contention-editor textarea').val(this.model.get('contention'));
    this.$('.edit-contention').focus();
  },

  closeEditor: function(e) {
    this.$('.hide-on-edit').removeClass('hidden');
    this.$('.contention-editor').addClass('hidden');
  },

  createEnter: function(e) {
    if(e.which == 13 && !e.shiftKey) {
      this.editContention(e);
    }
  },

  editContention: function(e) {
    e.preventDefault();
    this.model.editContention(this.$('.contention-editor textarea').val());
  },

  refuteContention: function(e) {
    e.preventDefault();
    this.model.refuteContention();
  },

  applyMarkdown: function(value) {
    this.$('.markdown').html(markdown.toHTML(value));
  }
});
