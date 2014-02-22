require 'spec_helper'

describe TournamentsController do

  describe 'GET index' do
    it 'responds with all tournaments for current user'

  end

  describe 'GET show' do
    it 'responds with the requested tournament'

  end

  describe 'POST create' do
    before :each do
      @tournament = create(:tournament)
    end

    context 'with valid attributes' do
      it 'saves new tournament to database' do
        expect{
          post :create, attributes_for(:tournament)
        }.to change(Tournament, :count).by(1)
      end

      it 'responds with the new tournament'
    end

    context 'with invalid attributes'

  end

  describe 'PUT update' do

  end

  describe 'DELETE destroy' do
    it 'removes user from database' do
      @tournament = create(:tournament)
      expect{
        delete :destroy, id: @tournament.id
      }.to change(Tournament, :count).by(-1)
    end
  end

end
