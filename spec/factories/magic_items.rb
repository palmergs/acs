FactoryGirl.define do
  factory :magic_item do
    adventure
    tile_picture
    sequence(:name) {|n| "Magic Item ##{ n }" }
    description "This thing glows with an eerie preternatural light..."
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
