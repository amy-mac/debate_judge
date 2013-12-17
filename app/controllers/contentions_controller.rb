class ContentionsController < ApplicationController
  respond_to :json

  def index
    respond_with User.find(current_user.id).contentions
  end

  def show
    if User.find(current_user.id).contentions.find(params[:id]).errors.empty?
      respond_with Contention.find(params[:id])
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def create
    contention = Contention.create(params.slice(:speech_type, :contention))
    # round_id = params.slice(:round_id)
    if contention.errors.empty?
      Round.find(params[:round_id]).contentions << contention
      respond_with contention
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def update
    respond_with Contention.update(params[:id], params.slice(:contention))
  end

  def destroy
    if User.find(current_user.id).contentions.find(params[:id]).errors.empty?
      respond_with Contention.destroy(params[:id])
    else
      render json: {status: 'error'}, status: 500
    end
  end
end
