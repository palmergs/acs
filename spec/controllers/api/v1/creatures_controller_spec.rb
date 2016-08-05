require 'rails_helper'

RSpec.describe Api::V1::CreaturesController, as: :controller do

  let(:adventure) { create(:adventure) }
  let(:tile_picture) { create(:tile_picture, adventure: adventure) }
  let(:creature) { create(:creature, adventure: adventure, tile_picture: tile_picture) }

  describe '#index' do
    it 'returns creatures as JSON' do
      creature = create(:creature)
      get :index
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data'][0]['id']).to eq(creature.id.to_s)
    end
  end

  describe '#show' do
    it 'can show a creature' do
      get :show, params: { id: creature.id }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['id']).to eq(creature.id.to_s)
    end
  end

  describe '#create' do

    let(:create_params) {
      {
        data: {
          attributes: {
            name: 'Giant Weasel',
            "adventure-id" => adventure.id,
            "tile-picture-id" => tile_picture.id
          },
          type: 'creatures'
        }
      }
    }

    it 'can create a new creature' do
      post :create, params: create_params
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('Giant Weasel')
    end
  end

  describe '#update' do
    let(:update_params) {
      {
        data: {
          attributes: {
            name: 'Giant Golden Weasel'
          },
          type: 'creatures'
        }
      }
    }

    it 'can update an existing creature' do
      update_params[:id] = creature.id
      put :update, params: update_params
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('Giant Golden Weasel')
    end
  end

  describe '#destroy' do
    it 'can delete a creature' do
      delete :destroy, params: { id: creature.id }
      expect(response).to be_success
    end
  end
end
