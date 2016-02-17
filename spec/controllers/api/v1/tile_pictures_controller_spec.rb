require 'rails_helper'

RSpec.describe Api::V1::TilePicturesController, as: :controller do
  let(:tile_picture) { create(:tile_picture) }
  describe '#index' do
    it 'renders tile_pictures as json' do
      tpid = tile_picture.id
      get :index
      expect(response).to be_success

      hash = JSON.parse(response.body)
      expect(hash['data'].count).to eq(1)
    end
  end
end
