class Terrain < ApplicationRecord

  belongs_to :map
  
  belongs_to :tile_picture

  validates :encounter_chance, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }

  before_validation do
    self.description = '' unless self.description.present?
  end
end
