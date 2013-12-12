require 'spec_helper'

describe RoundsController do
  describe 'GET index' do
    get :index
    expect(response).to render_json
  end

  describe 'GET show' do
    get :show
    expect(response).to render_json
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
