require "rails_helper"

RSpec.describe Api::V1::PicturesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/api/v1/pictures").to route_to("api/v1/pictures#index")
    end

  end
end
