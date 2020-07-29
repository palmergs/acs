class Terrain < ApplicationRecord
  belongs_to :map

  has_many :terrain_creatures, dependent: :destroy
  has_many :creatures, through: :terrain_creatures

  validates :name, presence: true, uniqueness: true
end
