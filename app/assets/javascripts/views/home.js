DebateJudge.Views.Home = Backbone.View.extend({
  template: JST['home'],
  el: '#main',

  events: {
    'click .sign_up_link':      'signUpPage',
    'click .try_demo':          'tryDemo',
    'click #myModal > .cancel': 'clearFields'
  },

  render: function() {
    $(this.el).html(this.template());
    return this;
  },

  signUpPage: function(e) {
    e.preventDefault();
    page('/users/new');
  },

  tryDemo: function(e) {
    var view = new DebateJudge.Views.UsersSignIn();
    $('.modal-content').html(view.render().el);
    $('#new_session_email').val('test@amy-mac.com');
    $('#new_session_pass').val('foobarbaz');
    $('#myModal').modal('show');
  }
});
