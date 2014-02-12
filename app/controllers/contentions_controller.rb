class ContentionsController < ApplicationController
  respond_to :json

  def index
    respond_with User.find(current_user.id).contentions
    # respond_with User.find(current_user.id).contentions.where(round_id: params[:round_id])
  end

  def show
    if User.find(current_user.id).contentions.find(params[:id]).errors.empty?
      respond_with Contention.find(params[:id])
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def create
    round = Round.find(params[:round_id])
    contention = round.contentions.create(params.slice(:speech_type, :contention))

    if contention.errors.empty?
      respond_with contention
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def update
    respond_with Contention.update(params[:id], params.slice(:contention, :refuted))
  end

  def destroy
    if User.find(current_user.id).contentions.find(params[:id]).errors.empty?
      respond_with Contention.destroy(params[:id])
    else
      render json: {status: 'error'}, status: 500
    end
  end
end
