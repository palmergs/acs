require 'rails_helper'

RSpec.describe Api::V1::CreaturesController, as: :controller do

  let(:adventure) { create(:adventure) }
  let(:creature) { create(:creature, adventure: adventure) }

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
    it 'can create a new creature' do
      post :create, params: {
        creature: {
          type: 'Creature',
          name: 'Giant Weasel',
          adventure_id: adventure.id,
          tile_picture_id: create(:tile_picture, adventure: adventure)
        }
      }
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data']['attributes']['name']).to eq('Giant Weasel')
    end
  end

  describe '#update' do
    it 'can update an existing creature' do
      put :update, params: {
        id: creature.id,
        creature: {
          name: 'Giant Golden Weasel'
        }
      }
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
