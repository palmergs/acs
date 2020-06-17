# frozen_string_literal: true

# SpriteMap represents a image with images on it
# Each image on the sprite map is assumed to be the same
# size.
class SpriteMap < ApplicationRecord
  validates :path, presence: true, uniqueness: true
  validates :name, presence: true

  def max_idx
    @_max_idx = sprites_per_row * (height / sprite_height)
  end

  def sprites_per_row
    @_sprites_per_row = width / sprite_width
  end

  # Sprites in a map can be described as a linear index
  def from_idx idx
    y = idx / sprites_per_row
    x = idx % sprites_per_row
    rect(x, y)
  end

  # Given a sprite position in row, col return the pixel position and size
  def from row, col
    rect(col, row)
  end

  # Given a sprite position in x,y return the pixel position and size
  # rubocop:disable Naming/MethodParameterName
  def rect x, y
    [x * sprite_width, y * sprites_per_row, sprite_width, sprite_height]
  end
  # rubocop:enable Naming/MethodParameterName
end
