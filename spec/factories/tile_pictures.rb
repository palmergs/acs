FactoryBot.define do
  factory :tile_picture do
    adventure
    sequence(:name) {|n| "Tile Picture ##{ n }" }
    path { "pictures/icons/#{ name }.png" }
    category TilePicture::CATEGORY_ITEM
    setting TilePicture::SETTING_FANTASY
  end
end
