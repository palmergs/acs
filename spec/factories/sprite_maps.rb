FactoryBot.define do
  factory :sprite_map do
    name { Faker::File.file_name(ext: 'png') }
    path { File.join(Faker::File.dir, name).to_s }
    sprite_width { 64 }
    sprite_height { 96 }
    width { 640 }
    height { 960 }
  end
end
