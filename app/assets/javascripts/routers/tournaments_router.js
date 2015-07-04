DebateJudge.Routers.Tournaments = Backbone.Router({
  routes: {
    '':                 'index',
    'tournaments/:id':  'show',
    'users/:id':        'userShow',
    'users/new':        'userNew',
    'users/create':     'create',
    'users/edit':       'edit'
  },

  initialize: function() {
    this.collection = new DebateJudge.Collections.Tournaments();
    this.collection.fetch();
  },

  index: function() {
    var view = new DebateJudge.Views.TournamentsIndex({collection: this.collection});
    $('#main').html(view.render().el)
  },

  show: function(id) {
    alert("show page");
  },

  userNew: function() {
    alert("Test");
    var view = new DebateJudge.Views.UsersNew();
    $('#main').html(view.render().el);
  }
});
