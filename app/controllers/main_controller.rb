class MainController < ApplicationController

  def index
    gon.currentUserID = current_user.try(:id)
  end
end
