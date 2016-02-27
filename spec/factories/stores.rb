FactoryGirl.define do
  factory :store do
    adventure
    tile_picture
    sequence(:name) {|n| "Store ##{ n }" }
    description "A quaint building with old-timey advertisements on the walls..."
  end
end
