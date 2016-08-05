require 'rails_helper'

RSpec.describe Api::V1::AdventuresController, as: :controller do

  let(:adventure) { create(:adventure) }

  describe '#index' do
    it 'returns serialized adventures' do
      aid = adventure.id
      get :index
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data'].count).to eq(1)
    end
  end

  describe '#show' do
    it 'returns a serialized adventure' do
      aid = adventure.id
      get :show, params: { id: aid }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['id']).to eq(aid.to_s)
    end
  end

  describe '#create' do
    it 'can generate an adventure' do
      post :create, params: { adventure: { 
        type: 'Adventure', 
        name: 'A new adventure', 
        description: 'Test' } }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      pp hash
      expect(hash['data']['attributes']['rating']).to eq(Adventure::RATING_GENERAL)
      expect(hash['data']['attributes']['access']).to eq(Adventure::ACCESS_PRIVATE)
    end
  end

  describe '#update' do
    it 'can update an adventure' do
      aid = adventure.id
      put :update, params: { id: aid, adventure: { name: 'A renamed adventure' }}
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('A renamed adventure')
    end
  end

  describe '#destroy' do
    it 'can destroy an adventure' do
      aid = adventure.id
      delete :destroy, params: { id: aid }
      expect(response).to be_success
    end
  end
end
