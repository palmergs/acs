require 'rails_helper'

RSpec.describe Api::V1::TerrainsController, as: :controller do
  let(:terrain) { create(:terrain) }
  describe '#index' do
    it 'can serializer terrain' do
      tid = terrain.id
      get :index
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data'].count).to eq(1)
    end
  end
end
