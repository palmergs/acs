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
end
