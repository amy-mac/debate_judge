class RoundsController < ApplicationController
  skip_before_filter :authorize
  respond_to :json

  def index
    respond_with Round.all
  end

  def show
    if User.find(current_user.id).rounds.find(params[:id]).errors.empty?
      respond_with Round.find(params[:id])
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def create
    round = Round.create(params[:round])

    if round.errors.empty?
      respond_with round
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def update
    respond_with Round.update(params[:id], params[:round])
  end

  def destroy
    respond_with Round.destroy(params[:id])
  end
end
