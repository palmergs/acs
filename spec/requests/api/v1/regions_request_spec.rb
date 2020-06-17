require 'rails_helper'

RSpec.describe 'Api::V1::Regions', type: :request do
  let(:adv) { create(:adventure) }
  let(:region) { create(:region) }

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/regions'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/api/v1/regions/#{ region.id }"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /update' do
    it 'returns http success' do
      put "/api/v1/regions/#{ region.id }", params: {
        data: {
          type: 'regions',
          attributes: {
            name: 'Bill & Ted', descr: 'An excellent region'
          }
        }
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post '/api/v1/regions', params: {
        data: {
          type: 'regions',
          attributes: {
            adventure_id: adv.id, name: 'Bill and Ted', descr: 'An excellent region'
          }
        }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete "/api/v1/regions/#{ region.id }"
      expect(response).to have_http_status(:success)
    end
  end
end
