class TournamentsController < ApplicationController
  respond_to :json

  def index
    respond_with Tournament.all
  end
end
