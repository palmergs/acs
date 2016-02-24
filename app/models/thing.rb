class Thing < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription
  include Concerns::HasEffect

  ACTIVATE_PICKUP = 'pickup'
  ACTIVATE_DROP = 'drop'
  ACTIVATE_USE = 'use'

  belongs_to :adventure
  belongs_to :tile_picture

  belongs_to :spell, optional: true

  has_many :items, dependent: :destroy
  has_many :rooms, through: :items

  has_many :creature_things, dependent: :destroy
  has_many :creatures, through: :creature_things

end
