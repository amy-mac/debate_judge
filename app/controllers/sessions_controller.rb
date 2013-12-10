class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to user_path(user), notice: "Welcome Back"
    else
      flash[:error] = "Error, does not computer!"
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
