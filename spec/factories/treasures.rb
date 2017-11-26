FactoryBot.define do
  factory :treasure do
    adventure
    tile_picture
    sequence(:name) {|n| "Treasure ##{ n }" }
    description "A clearly valuable thing of unusual size..."
    weight 10
    value 100
    disappear false
    power 0
    attack_adj 0
    breakability 0
    magic false
    owner_only false
    range 0
    pickup "You feel heavier..."
    drop "You feel lighter..."
    max_carry 3
    max_stack 1
  end
end
