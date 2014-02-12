class RoundsController < ApplicationController
  respond_to :json

  def index
    if current_user
      respond_with User.find(current_user.id).rounds
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def show
    if User.find(current_user.id).rounds.find(params[:id]).errors.empty?
      respond_with Round.find(params[:id])
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def create
    round = Tournament.find(params[:tournament_id]).rounds.create(params[:round])

    if round.errors.empty?
      respond_with round
    else
      round.destroy()
      respond_with round
    end
  end

  def update
    if params[:updated_at]
      Round.update(params[:id], params[:updated_at])
    else
      respond_with Round.update(params[:id], params[:round])
    end
  end

  def destroy
    respond_with Round.destroy(params[:id])
  end
end
