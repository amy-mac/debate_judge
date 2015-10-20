class MainController < ApplicationController
  skip_before_filter :authorize, only: [:index]

  def index
    gon.currentUserID = current_user.try(:id)
  end
end
