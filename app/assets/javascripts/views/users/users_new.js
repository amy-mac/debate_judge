DebateJudge.Views.UsersNew = Backbone.View.extend({
  template: JST['users/new'],
  className: 'container',

  events: {
    'submit #new_user': 'addUser'
  },

  initialize: function() {
    this.listenTo(this.model, "invalid", this.printErrors);
  },

  render: function() {
    $(this.el).html(this.template());
    return this;
  },

  attributes: function() {
    return {
      name: $('#new_user_name').val(),
      email: $('#new_user_email').val(),
      password: $('#new_user_password').val(),
      password_confirmation: $('#new_user_password_confirmation').val()
    };
  },

  addUser: function(e) {
    e.preventDefault();
    var self = this;

    this.model.save(this.attributes(), {
      wait: true,
      success: function(data) {
        window.location.href = '/tournaments';
      },
      error: function(model, response) {
        var errors = $.parseJSON(response.responseText).errors;
        self.printErrors(this.model, errors);
      }
    });
  },

  printErrors: function(model, errors) {
    this.$('#error-notice').addClass('alert alert-danger');
    this.$('#error-notice').empty();

    // Look at refactoring this
    if (_.isArray(errors)) {
      _.each(errors, function(error) {
        this.$('#error-notice').append("<p>" + error + "</p>");
      });
    } else {
      _.each(errors, function(error_list, attribute) {
        error_list.forEach(function(error) {
          this.$('#error-notice').append("<p>" + _.capitalize(attribute) + " " + error + "</p>");
        });
      });
    }
  }
});
