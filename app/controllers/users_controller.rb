class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])

    if @user.errors.empty?
      sign_in(@user)
      respond_with @user
    else
      respond_with User.create(params[:user])
    end
  end

  def edit
  end

  def update
    respond_with User.find(current_user).update_attributes(params.slice(:name, :email))
  end

  def destroy
    respond_with User.destroy(params[:id])
  end
end