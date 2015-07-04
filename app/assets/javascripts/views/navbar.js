DebateJudge.Views.Navbar = Backbone.View.extend({
  template: JST['navbar'],
  className: 'container',

  events: {
    'click #sign_up_link':  'signUpPage',
    'click .navbar-brand':  'indexPage',
    'click #sign_in_link':  'showSignIn',
    'click #signOut':       'deleteSession',
    'click #editAccount':   'editUser',
    'click #myTournaments': 'tournamentsPage'
  },

  initialize: function() {
    if(this.collection) {
      this.listenTo(this.collection, 'all', this.render());
    }
  },

  render: function() {
    if(this.collection) {
      this.recentRounds();
    }
    $(this.el).html(this.template({navRecent: this.recent}));
    return this;
  },

  indexPage: function(e) {
    e.preventDefault();
    page('/');
  },

  signUpPage: function(e) {
    e.preventDefault();
    page('/users/new');
  },

  deleteSession: function(e) {
    e.preventDefault();
    var req = $.ajax({
      url: "/sessions/destroy",
      method: 'post',
    }).done(function() {
      window.location.href = '/';
    });
  },

  editUser: function(e) {
    e.preventDefault();
    page("/users/#{gon.currentUser.id}");
  },

  tournamentsPage: function(e) {
    e.preventDefault();
    page("/tournaments");
  },

  recentRounds: function() {
    this.recent = new DebateJudge.Collections.Rounds(this.collection.last(5));
    this.recent.comparator = 'updated_at';
    this.recent.sort().models.reverse();
  },

  showSignIn: function() {
    var view = new DebateJudge.Views.UsersSignIn();
    $('.modal-content').html(view.render().el);
  }
});
