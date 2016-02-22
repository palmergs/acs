class Creature < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription
  include Concerns::HasCreatureAttributes
  include Concerns::HasStrategy

  belongs_to :adventure
  belongs_to :tile_picture

  has_many :actors, dependent: :destroy
  has_many :rooms, through: :room_creatures

  has_many :creature_things, dependent: :destroy
  has_many :things, through: :creature_things
end
