window.DebateJudge = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    page();

    var nav = new DebateJudge.Views.Navbar();
    $('#navbar').html(nav.render().el);

    if(!gon.currentUserID) {
      page('/');
    }
  }
};

$(document).ready(function() {
  DebateJudge.initialize();
});

page('/', function() {
  if(gon.currentUserID) {
    page('/tournaments');
  } else {
    $('#round_page').empty();
    var view = new DebateJudge.Views.Home()
    view.render();
  }
});

page('/tournaments', function() {
  var self = this;
  $('#round_page').empty();
  this.collection = new DebateJudge.Collections.Tournaments();
  this.rounds = new DebateJudge.Collections.Rounds();
  this.rounds.fetch().then(function() {
    self.collection.fetch().then(function() {
      var view = new DebateJudge.Views.TournamentsIndex({collection: self.collection, rounds: self.rounds});
      $('#main').html(view.render().el);
    });
  });
});

page('/rounds/:id', function(ctx) {
  var self = this;
  this.userContentions = new DebateJudge.Collections.Contentions();
  this.model = new DebateJudge.Models.Round({id: ctx.params.id});
  this.userContentions.fetch().then(function() {
    self.model.fetch().then(function() {
      var view = new DebateJudge.Views.Round({model: self.model, collection: self.userContentions});
      $('#main').empty();
      $('#round_page').html(view.render().el);
    });
  });
});

page('/users/new', function() {
  $('#round_page').empty();
  this.model = new DebateJudge.Models.User();
  var view = new DebateJudge.Views.UsersNew({model: this.model});
  $('#main').html(view.render().el);
});

page('/users/:id', function() {
  var self = this;
  $('#round_page').empty();
  this.model = new DebateJudge.Models.User({id: gon.currentUserID});
  this.model.fetch().then(function() {
    var view = new DebateJudge.Views.UsersShow({model: self.model});
    $('#main').html(view.render().el);
  });
});
