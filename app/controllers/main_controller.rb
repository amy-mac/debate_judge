class MainController < ApplicationController

  def index
    gon.currentUser = current_user
    # binding.pry
  end
end
