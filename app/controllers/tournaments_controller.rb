class TournamentsController < ApplicationController
  respond_to :json

  def index
    if current_user
      respond_with User.find(current_user.id).tournaments
    else
      render json: {status: 'error'}, status: 500
    end
  end

  def show
    respond_with Tournament.find(params[:id])
  end

  def create
    tournament = Tournament.create(params.slice(:tournament, :school, :date))

    if tournament.errors.empty?
      User.find(current_user.id).tournaments << tournament
      respond_with tournament
    else
      render_with Tournament.create(params.slice(:tournament, :school, :date))
    end
  end

  def update
    respond_with Tournament.update(params[:id], params[:tournament])
  end

  def destroy
    respond_with Tournament.destroy(params[:id])
  end
end
