require 'rails_helper'

RSpec.describe Api::V1::RoomsController, as: :controller do

  let(:room) { create(:room) }

  describe '#index' do
    it 'returns serialized rooms' do
      rid = room.id
      get :index
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data'].count).to eq(1)
    end
  end

  describe '#show' do
    it 'returns a serialized room' do
      rid = room.id
      get :show, params: { id: rid }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['id']).to eq(rid.to_s)
    end
  end

  describe '#create' do
    it 'can generate an room' do
      rid = create(:region).id
      post :create, params: {
        room: {
          region_id: rid,
          name: 'A new room',
          width: 20,
          height: 20,
          x: 0,
          y: 0
        }
      }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['region_id']).to eq(rid)
    end
  end

  describe '#update' do
    it 'can update a room' do
      rid = room.id
      put :update, params: { id: rid, room: { name: 'A renamed room' }}
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('A renamed room')
    end
  end

  describe '#destroy' do
    it 'can destroy a room' do
      rid = room.id
      delete :destroy, params: { id: rid }
      expect(response).to be_success
    end
  end
end
