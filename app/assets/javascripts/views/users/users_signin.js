DebateJudge.Views.UsersSignIn = Backbone.View.extend({
  template: JST['users/signin'],

  events: {
    'submit #new_session': 'newSession'
  },

  initialize: function() {
    $('.modal-dialog').addClass('modal-sm');
  },

  render: function() {
    $(this.el).html(this.template());
    return this;
  },

  newSession: function(e) {
    e.preventDefault();
    var self = this;

    $.ajax('/sessions', {
      type: 'POST',
      data: {
        email: this.$('#new_session_email').val(),
        password: this.$('#new_session_pass').val()
      },
      error: function(data) {
        self.printErrors();
      },
      success: function(data, textStatus, jqXHR) {
        window.location.href = '/tournaments';
      }
    });
  },

  printErrors: function() {
    this.$('#error-notice').addClass('alert alert-danger');
    this.$('#error-notice').empty().html('Password/Email combination does not exist');
  },

  clearFields: function(e) {
    e.preventDefault();

    $('#new_session_email').val('');
    $('#new_session_pass').val('');
  }
});
