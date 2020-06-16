require 'rails_helper'

RSpec.describe "Api::V1::Maps", type: :request do
  let(:adv) { create(:adventure) }
  let(:map) { create(:map) }


  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/maps"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/maps/#{ map.id }"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /update" do
    it "returns http success" do
      put "/api/v1/maps/#{ map.id }", params: {
        data: {
          type: 'maps',
          attributes: {
            name: 'Bill & Ted', intro: 'An excellent map'
          }
        }
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/api/v1/maps", params: { 
        data: {
          type: 'maps',
          attributes: { 
            adventure_id: adv.id, name: 'Bill and Ted', intro: 'An excellent map'
          }
        }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      delete "/api/v1/maps/#{ map.id }"
      expect(response).to have_http_status(:success)
    end
  end
end
