FactoryGirl.define do
  factory :spell do
    type "Spell"
    adventure
    sequence(:name) {|n| "Spell ##{ n }" }
    description "A spell of immense power and subtle effect."
    activate "The spell activates with a huge roar and the faint spell of tulips..."
  end

end
