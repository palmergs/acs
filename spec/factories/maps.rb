FactoryGirl.define do
  factory :map do
    adventure
    sequence(:name) {|n| "Map ##{ n }" }
    description "A land of deep forests, high mountains, verdant plains, blistering deserts, and fast flowing rivers."
    width 40
    height 40
  end
end
