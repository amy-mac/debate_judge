class UsersController < ApplicationController
  respond_to :html, :json

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'Account was created successfully'
    else
      flash[:error] = 'Oops! Something went wrong'
    end
    respond_with @user
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
