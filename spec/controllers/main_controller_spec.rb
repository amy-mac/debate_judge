require 'spec_helper'

describe MainController do
  include SessionsHelper
  
  describe 'GET index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns current_user to Gon variable' do
      get :index
      expect(assigns(:gon.currentUser)).to eq(:current_user)
    end
  end

end
