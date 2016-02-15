FactoryGirl.define do
  factory :adventure do
    sequence(:name) {|n| "Adventure ##{ n }" }
    description "A fantasy romp with unicorns and elves and dwarves and gems and ..."
    intro "After a long journey you find yourself at the top of a path that leads down into a ..."
    rating "general"
    access "private"
  end

end
