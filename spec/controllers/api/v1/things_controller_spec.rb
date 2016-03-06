require 'rails_helper'

RSpec.describe Api::V1::ThingsController, as: :controller do

  let(:adventure) { create(:adventure) }
  let(:thing) { create(:thing, adventure: adventure) }

  describe '#index' do
    it 'returns things as JSON' do
      thing = create(:thing)
      get :index
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data'][0]['id']).to eq(thing.id.to_s)
    end
  end

  describe '#show' do
    it 'returns a thing as JSON' do
      get :show, params: { id: thing.id }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['id']).to eq(thing.id.to_s)
    end
  end

  describe '#create' do
    it 'creates a new thing' do
      post :create, params: {
        thing: {
          type: 'Treasure',
          name: 'Book',
          description: 'A book.',
          tile_picture_id: create(:tile_picture, adventure: adventure).id,
          adventure_id: adventure.id
        }
      }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('Book')
    end
  end

  describe '#update' do
    it 'updates an existing thing' do
      put :update, params: {
        id: thing.id,
        thing: {
          name: 'Book of Secrets',
          description: 'A book that contains secret info.'
        }
      }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('Book of Secrets')
    end
  end

  describe '#destroy' do
    it 'destroys an existing thing' do
      delete :destroy, params: { id: thing.id }
      expect(response).to be_success
    end
  end
end
