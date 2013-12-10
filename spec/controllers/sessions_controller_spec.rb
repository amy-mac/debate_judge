require 'spec_helper'

describe SessionsController do
  include SessionsHelper

  describe "POST #create" do
    context 'user entry is valid' do
      it 'checks whether user is in database' do
        user = create(:user, email: "test@test.com")
        post :create, email: "test@test.com", password: "foobar00"
        expect(assigns(:user)).to eq(user)
      end

      it 'authenticates the password'
    end
        
    it 'does not create a new session if user is invalid'
  
  end

  describe "DELETE #destroy" do
    before :each do
      @user = create(:user)
      sign_in(@user)
    end

    it 'deletes the session of current_user' do
      delete :destroy, id: @user
      expect(current_user).to eq(nil)
    end
      
    # it 'redirects to home page' do
    #   delete :destroy, id: @user
    #   expect(response).to redirect_to root_path
    # end
    
  end
end
