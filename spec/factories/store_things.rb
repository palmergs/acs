FactoryGirl.define do
  factory :store_thing do
    store  { create(:thing) }
    thing
    count 1
  end

end
