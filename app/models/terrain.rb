class Terrain < ApplicationRecord
  belongs_to :map

  validates :name, presence: true, uniqueness: true
end
