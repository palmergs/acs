FactoryBot.define do
  factory :map_region do
    map
    region
    map_x { rand(self.map.width - 1) + 1 }
    map_y { rand(self.map.height - 1) + 1 }
    region_x { rand(self.region.width - 1) + 1 }
    region_y { rand(self.region.height - 1) + 1 }

    travel { MapRegion::ASK_BEFORE }
    enter_region { 'You are entering the region...' }
  end
end
