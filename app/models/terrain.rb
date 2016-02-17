class Terrain < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  belongs_to :map

  belongs_to :tile_picture

  validates :encounter_chance, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }
end
