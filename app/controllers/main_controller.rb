class MainController < ApplicationController

  def index
    gon.currentUser = current_user
  end
end
