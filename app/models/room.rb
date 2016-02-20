class Room < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  belongs_to :region
  has_one :map, through: :region
  has_one :adventure, through: :map

  has_many :room_creatures, dependent: :destroy
  has_many :creatuers, through: :room_creatures

  has_many :room_things, dependent: :destroy
  has_many :things, through: :room_things

  validates :width, numericality: { only_integer: true, greater_than: 2, less_than: 1000 }
  validates :height, numericality: { only_integer: true, greater_than: 2, less_than: 1000 }
  validates :x, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :y, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :validate_fits_in_region, :validate_does_not_overlap

  def x2
    self.x + self.width
  end

  def y2
    self.y + self.height
  end

  def validate_fits_in_region
    region = self.region
    x2, y2 = x + width, y + height
    errors.add(:x, "Room extends past region width.") if x2 > region.width
    errors.add(:y, "Room extends past region height.") if y2 > region.height
  end

  def validate_does_not_overlap
    region.rooms.each do |other|
      if other != self
        errors.add(:base, "Room overlaps another room.") if overlaps?(other)
      end
    end
  end

  def overlaps? other

    # surrounds completely
    return true if x <= other.x && y <= other.y && x2 > other.x2 && y2 > other.y2

    # left edge
    if x >= other.x && x < other.x2
      return true if y >= other.y && y < other.y2
      return true if y2 >= other.y && y2 < other.y2
    end

    # right edge
    if x2 >= other.x && x2 < other.x2
      return true if y >= other.y && y < other.y2
      return true if y2 >= other.y && y2 <= other.y2
    end

    false
  end
end
