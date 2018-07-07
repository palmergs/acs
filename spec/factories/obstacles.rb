FactoryBot.define do
  factory :obstacle do
    adventure
    tile_picture
    sequence(:name) {|n| "Obstacle ##{ n }" }
    description "A solid wall made of hard and dense material..."
  end
end
