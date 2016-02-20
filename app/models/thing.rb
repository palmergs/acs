class Thing < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  ACTIVATE_PICKUP = 'pickup'
  ACTIVATE_DROP = 'drop'
  ACTIVATE_USE = 'use'

  belongs_to :adventure
  belongs_to :tile_picture
  belongs_to :spell, optional: true

  has_many :room_things, dependent: :destroy
  has_many :rooms, through: :room_things

  has_many :creature_things, dependent: :destroy
  has_many :creatures, through: :creature_things

end
