class RoundsController < ApplicationController
  respond_to :json

  def index
    respond_with Round.all
  end

  def show
    respond_with Round.find(params[:id])
  end

  def new

  end

  def create
    round = Round.create(params[:round])

    if round.errors.empty?
      respond_with round
    else
      respond_with round.errors
    end
  end

  def edit

  end

  def update

  end

  def destroy
    respond_with Round.find(params[:id]).destroy
  end
end
