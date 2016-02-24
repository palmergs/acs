FactoryGirl.define do
  factory :weapon do
    adventure
    tile_picture
    sequence(:name) {|n| "Weapon ##{ n }" }
    description "A glittering sword inscribed with ancient runes..."
    weight 40
    value 100
    disappear false
    power 5
    attack_adj(5)
    breakability 1
    magic false
    owner_only false
    range 0
    pickup "You feel heavier..."
    drop "You feel lighter..."
    max_carry 1
    max_stack 1
  end
end
