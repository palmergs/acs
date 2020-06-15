FactoryBot.define do
  factory :room do
    region
    name { Faker::House.room }

    # The Room is 8 tiles x 8 tiles (including walls)
    width { 8 }
    height { 8 }

    # Room located in the top left corner of the region
    region_x { 0 }
    region_y { 0 }

    # Room uses the first tile from the adventure sprite map as the wasll
    wall_tile_idx { 0 }
  end
end
