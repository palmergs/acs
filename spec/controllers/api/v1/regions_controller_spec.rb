require 'rails_helper'

RSpec.describe Api::V1::RegionsController, as: :controller do

  let(:region) { create(:region) }

  describe '#index' do
    it 'returns serialized regions' do
      rid = region.id
      get :index
      expect(response).to be_success

      hash = JSON.parse(response.body)  
      expect(hash['data'].count).to eq(1)
    end
  end

  describe '#show' do
    it 'returns a serialized region' do
      rid = region.id
      get :show, params: { id: rid }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['id']).to eq(rid.to_s)
    end
  end

  describe '#create' do
    it 'can generate an region' do
      mid = create(:map).id
      post :create, params: {
        region: {
          map_id: mid,
          name: 'A new region',
          width: 20,
          height: 20
        }
      }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['map_id']).to eq(mid)
    end
  end

  describe '#update' do
    it 'can update a region' do
      rid = region.id
      put :update, params: { id: rid, region: { name: 'A renamed region' }}
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('A renamed region')
    end
  end

  describe '#destroy' do
    it 'can destroy a region' do
      rid = region.id
      delete :destroy, params: { id: rid }
      expect(response).to be_success
    end
  end
end
