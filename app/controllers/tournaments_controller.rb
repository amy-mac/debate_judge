class TournamentsController < ApplicationController
  skip_before_filter :authorize
  respond_to :json

  def index
    respond_with Tournament.all
  end

  def show
    respond_with Tournament.find(params[:id])
  end

  def create
    respond_with Tournament.create(params.slice(:tournament, :school, :date))
  end

  def update
    respond_with Tournament.update(params[:id], params[:tournament])
  end

  def destroy
    respond_with Tournament.destroy(params[:id])
  end
end
