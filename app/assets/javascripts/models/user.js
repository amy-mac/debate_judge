DebateJudge.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users',
  paramRoot: 'user',

  initialize: function() {
  },

  validate: function(attrs) {
    this.errors = [];

    if (attrs.password.length < 6) {
      this.errors.push("Password must be at least 6 characters");
    }

    if (attrs.password !== attrs.password_confirmation) {
      this.errors.push("Password and Password Confirmation do not match");
    }

    if (!_.isEmpty(this.errors)) {
      return this.errors;
    }
  },

  editInfo: function(attrs) {
    this.save(attrs, {patch: true});
  }
});
