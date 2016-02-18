class Thing < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  ACTIVATE_PICKUP = 'pickup'
  ACTIVATE_DROP = 'drop'
  ACTIVATE_USE = 'use'

  belongs_to :adventure
  belongs_to :tile_picture

end
