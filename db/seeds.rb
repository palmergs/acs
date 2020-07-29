# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SpriteMap.find_or_create_by(name: 'default') do |obj|
  obj.path = 'default-1280x960.png'
  obj.width = 1280
  obj.height = 960
  obj.sprite_width = 64
  obj.sprite_height = 96
end

SpriteMap.find_or_create_by(name: Adventure::FANTASY) do |obj|
  obj.path = 'default-1280x960.png'
  obj.width = 1280
  obj.height = 960
  obj.sprite_width = 64
  obj.sprite_height = 96
end

SpriteMap.find_or_create_by(name: Adventure::SPY) do |obj|
  obj.path = 'default-1280x960.png'
  obj.width = 1280
  obj.height = 960
  obj.sprite_width = 64
  obj.sprite_height = 96
end

SpriteMap.find_or_create_by(name: Adventure::SCIFI) do |obj|
  obj.path = 'default-1280x960.png'
  obj.width = 1280
  obj.height = 960
  obj.sprite_width = 64
  obj.sprite_height = 96
end

adventure = Adventure.find_or_create_by(name: 'Castle on the Hinterlands') do |obj|
  obj.descr = 'An exciting adventure set in the untamed wilderness of the kingdom.'
  obj.intro = 'Moneyless and on the run you have fled to the untamed wilderness to try and earn your fortune.'
end

map = Map.find_or_create_by(name: 'The Hinterlands') do |obj|
  obj.adventure = adventure
  obj.descr = 'The area around the castle.'
  obj.width = 80
  obj.height = 80
end

region = Region.find_or_create_by(name: 'The Castle') do |obj|
  obj.adventure = adventure
  obj.descr = 'The castle on the hinterlands.'
  obj.width = 40
  obj.height = 40
end
