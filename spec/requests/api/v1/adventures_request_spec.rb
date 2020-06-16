require 'rails_helper'

RSpec.describe "Api::V1::Adventures", type: :request do
  let(:sprites) { create(:sprite_map) }
  let(:adv) { create(:adventure) }


  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/adventures"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/adventures/#{ adv.id }"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /update" do
    it "returns http success" do
      put "/api/v1/adventures/#{ adv.id }", params: {
        data: {
          type: 'adventures',
          attributes: {
            name: 'Bill & Ted', intro: 'An excellent adventure'
          }
        }
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/api/v1/adventures", params: { 
        data: {
          type: 'adventures',
          attributes: { 
            name: 'Bill and Ted', intro: 'An excellent adventure', sprite_map_id: sprites.id
          }
        }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      delete "/api/v1/adventures/#{ adv.id }"
      expect(response).to have_http_status(:success)
    end
  end

end
