class DebateJudge.Models.User extends Backbone.Model
  urlRoot: '/api/users'
  paramRoot: 'user'

  validate: (attrs) ->
    @errors = []
    @errors.push("Password must be at least 6 characters") if attrs.password.length < 6
    
    @errors.push("Password and Password Confirmation do not match") if attrs.password isnt attrs.password_confirmation

    return @errors if not _.isEmpty(@errors)

  editInfo: (attrs) ->
    @save attrs