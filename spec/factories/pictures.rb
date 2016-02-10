FactoryGirl.define do
  factory :picture do
    sequence(:name) {|n| "My Picture #{ n }" }
    description "License or description of this picture"
    category "testing"
    sequence(:path) {|n| "pictures/testing/my-picture-#{ n }.png" }
  end
end
