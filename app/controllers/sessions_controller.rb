class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  respond_to :html, :json

  def new
    gon.currentUserID = current_user.try(:id)
  end

  def create
    @user = User.find_by_email(params[:email])

    unless @user
      flash.now[:error] = "A user with that email does not exist."
      render action: "new"
      return
    end

    if @user && @user.authenticate(params[:password])
      sign_in(@user, params[:remember])
      redirect_to tournaments_path, :notice => "You have successfully logged in."
    else
      flash.now[:error] = "Password is incorrect."
      render action: "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "You have successfully logged out."
  end
end
