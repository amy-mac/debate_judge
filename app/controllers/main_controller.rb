class MainController < ApplicationController

  def index
    gon.currentUser = current_user
    if current_user
      gon.userRounds = current_user.rounds.last(5)
    end
  end
end
