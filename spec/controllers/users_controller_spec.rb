require 'spec_helper'

describe UsersController do

  describe 'GET show' do
    before(:each) do
      @user = create(:user)
    end

    # it 'renders the :show view' do
    #   get :show, id: @user
    #   expect(response).to render_template(:show)
    # end

    it 'assigns the requested user to @user' do
      get :show, id: @user
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe 'GET new' do
    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do

    end

    context 'with invalid attributes' do

    end

  end

  describe 'GET edit' do

  end

  describe 'PUT update' do

  end

  describe 'DELETE destroy' do

  end

end
