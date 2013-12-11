class DebateJudge.Views.Navbar extends Backbone.View

  template: JST['navbar']
  className: 'container'

  events:
    'click #sign_up_link': 'signUpPage'

  render: ->
    $(@el).html(@template())
    @

  signUpPage: (e) ->
    e.preventDefault()
    # view = new DebateJudge.Views.UsersNew()
    # $('#main').html(view.render().el)
    page '/users/new'