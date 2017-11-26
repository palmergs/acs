FactoryBot.define do
  factory :terrain do
    map
    tile_picture
    sequence(:name) {|n| "Terrain ##{ n }" }
    description "A land of flowing... "
    encounter_chance 0
  end
end
