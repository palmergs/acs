FactoryBot.define do
  factory :portal do
    adventure
    tile_picture
    sequence(:name) {|n| "Portal ##{ n }" }
    description "A wooden door with a lock..."
  end
end
