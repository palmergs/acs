require 'rails_helper'

RSpec.describe Api::V1::MapsController, as: :controller do

  let(:map) { create(:map) }

  describe '#index' do
    it 'returns serialized maps' do
      mid = map.id
      get :index
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data'].count).to eq(1)
    end
  end

  describe '#show' do
    it 'returns a serialized map' do
      mid = map.id
      get :show, params: { id: mid }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['id']).to eq(mid.to_s)
    end
  end

  describe '#create' do
    it 'can generate an map' do
      aid = create(:adventure).id
      post :create, params: {
        map: {
          adventure_id: aid,
          name: 'A new map',
          width: 20,
          height: 20
        }
      }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['adventure_id']).to eq(aid)
    end
  end

  describe '#update' do
    it 'can update a map' do
      mid = map.id
      put :update, params: { id: mid, map: { name: 'A renamed map' }}
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('A renamed map')
    end
  end

  describe '#destroy' do
    it 'can destroy a map' do
      mid = map.id
      delete :destroy, params: { id: mid }
      expect(response).to be_success
    end
  end
end
