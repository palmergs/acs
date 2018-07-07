FactoryBot.define do
  factory :armor do
    adventure
    tile_picture
    sequence(:name) {|n| "Armor ##{ n }" }
    description "A suite of protective armor in exactly your size..."
    weight 100
    value 100
    disappear false
    power 5
    attack_adj(-5)
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
