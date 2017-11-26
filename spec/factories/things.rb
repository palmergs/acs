FactoryBot.define do
  factory :thing do
    type 'Thing'
    adventure
    tile_picture
    sequence(:name) {|n| "Thing ##{ n }" }
    description "An odd looking thing of unusual size..."
    weight 1
    value 1
    disappear false
    power 1
    attack_adj 1
    breakability 1
    magic false
    owner_only false
    range 1
    pickup "You feel heavier..."
    drop "You feel lighter..."
    max_carry 3
    max_stack 1
  end
end
