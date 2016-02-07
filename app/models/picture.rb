require 'slug_support'

class Picture < ApplicationRecord

  HEIGHT = 64
  WIDTH = 48
  OFFSET_TOP = 32
  OFFSET_LEFT = 8
  OFFSET_RIGHT = 8
  OFFSET_BOTTOM = 0
  TILE_HEIGHT = HEIGHT - OFFSET_TOP - OFFSET_BOTTOM
  TILE_WIDTH = WIDTH - OFFSET_LEFT - OFFSET_RIGHT

  before_validation do
    self.slug = SlugSupport.slugify(self.name) unless self.slug.present?
  end

end
