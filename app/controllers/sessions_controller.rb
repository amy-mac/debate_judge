class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  respond_to :html, :json

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      sign_in(user)
      respond_with @user, :location => '/', :notice => "Login succesful."
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "Logged out"
  end
end
