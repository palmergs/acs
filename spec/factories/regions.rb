FactoryGirl.define do
  factory :region do
    map
    sequence(:name) {|n| "Region ##{ n }" }
    description "A small town of no apparent import."
    width 40
    height 40
  end
end
