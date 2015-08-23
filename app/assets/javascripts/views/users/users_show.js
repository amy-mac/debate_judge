DebateJudge.Views.UsersShow = Backbone.View.extend({
  template: JST['users/show'],
  className: 'container',

  events: {
    'submit #editInfo': 'editInfo'
  },

  initialize: function() {
    this.model.on('reset', this.render, this);
  },

  render: function() {
    $(this.el).html(this.template({user: this.model}));
    return this;
  },

  editInfo: function(e) {
    e.preventDefault();

    var self = this;
    var attributes = {
      name: $('#editInfo_name').val(),
      email: $('#editInfo_email').val()
    };

    this.model.save(attributes, {
      validate: false,
      wait: true,
      success: function() {
        this.$('#error-notice').addClass('alert alert-success');
        this.$('#error-notice').empty().html("Your profile has been updated successfully");
      },
      error: function(model, response) {
        self.printErrors(this.model, response);
      }
    });
  },

  printErrors: function(model, errors) {
    this.$('#error-notice').addClass('alert alert-danger');
    this.$('#error-notice').empty();

    //for attribute, error of errors
    _.each(errors, function(error_list, attribute) {
      error_list.forEach(function(error) {
        this.$('#error-notice').append("<p>" + _.capitalize(attribute) + " " + error + "</p>");
      });
    });
  }
});
