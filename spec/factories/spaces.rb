FactoryGirl.define do
  factory :space do
    adventure
    tile_picture
    sequence(:name) {|n| "Space ##{ n }" }
    description "An open area where something is unlikely to happen..."
  end
end
