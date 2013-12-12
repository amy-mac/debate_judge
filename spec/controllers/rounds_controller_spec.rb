require 'spec_helper'

describe RoundsController do
  describe 'GET index' do
    it 'renders the JSON for all rounds' do
      get :index
      expect(response).to render_json
    end
  end

  describe 'GET show' do
    it 'renders the JSON for requested round' do
      get :show
      expect(response).to render_json
    end
  end

  describe 'GET new' do

  end

  describe 'POST create' do

  end

  describe 'GET edit' do

  end

  describe 'PUT update' do

  end

  describe 'DELETE destroy' do

  end
end
