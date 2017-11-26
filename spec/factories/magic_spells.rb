FactoryBot.define do
  factory :magic_spell do
    adventure
    tile_picture
    sequence(:name) {|n| "Magic Spell ##{ n }" }
    description "Your mind burns with eldrich power..."
    weight 0
    value 0
    disappear true
    power 10
    magic true
    owner_only true
    range 10
    pickup "Your gain a power..."
    drop "You lose a power..."
    max_carry 1
    max_stack 1
  end
end
