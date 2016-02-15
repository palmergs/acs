FactoryGirl.define do
  factory :room do
    region
    sequence(:name) {|n| "Room ##{ n }" }
    description "A wood paneled room."
    width 12
    height 10
    x 0
    y 0
  end
end
