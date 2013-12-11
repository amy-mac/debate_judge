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
      respond_with @user
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def edit
  end

  def update
    respond_with User.update(params[:id], params[:user])
  end

  def destroy
    respond_with User.destroy(params[:id])
  end
end
