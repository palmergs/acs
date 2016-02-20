class Creature < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  MAGIC_NONE = 'none'
  MAGIC_HALF = 'half'
  MAGIC_FULL = 'full'

  PERSONALITY_FIGHTER = 'fighter'
  PERSONALITY_SLINKER = 'slinker'

  OUTLOOK_AGGRESSIVE = 'aggressive'
  OUTLOOK_PEACEFUL = 'peaceful'

  ALLIANCE_ENEMY = 'enemy'
  ALLIANCE_FRIEND = 'friend'
  ALLIANCE_NEUTRAL = 'neutral'
  ALLIANCE_THIEF = 'thief'

  belongs_to :adventure
  belongs_to :tile_picture

  has_many :room_creatures, dependent: :destroy
end
