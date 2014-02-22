require 'spec_helper'

describe UsersController do
  include SessionsHelper

  describe 'GET show' do
    it 'responds with requested user' do
      @user = create(:user)
      get :show, id: @user.id
      expect(response.status).to eql(200)
      # expect(json).to have_key('user')
    end
  end

  describe 'GET new' do
    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST create' do
    before :each do
      @user = create(:user)
    end

    context 'with valid attributes' do
      it 'saves the user in the database' do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      # it 'signs in the user' do
      #   SessionsHelper.should_receive(:sign_in)
      # end

      it 'responds with the user'

    end

    context 'with invalid attributes' do
      it "doesn't save user to database" do
        expect{
          post :create, user: attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it 'responds with errors'

    end

  end

  describe 'PUT update' do

    context 'with valid attributes'

    context 'with invalid attributes'

  end

  describe 'DELETE destroy' do

    it 'deletes user from database' do
      @user = create(:user)
      expect{
        delete :destroy, id: @user        
      }.to change(User, :count).by(-1)
    end

  end

end
