class UserNotifier < ActionMailer::Base
  default from: "team@usearbitr.com"

  def signup_email(user)
    @user = user
    mail(to: @user.email, subject: "Thanks for signing up!")
  end

end
