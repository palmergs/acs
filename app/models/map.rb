class Map < ApplicationRecord

  belongs_to :adventure

  has_many :regions, dependent: :destroy

  has_many :terrains, dependent: :destroy

  validates :width, numericality: { only_integer: true, greater_than: 2, less_than: 1000 }
  validates :height, numericality: { only_integer: true, greater_than: 2, less_than: 1000 }

  before_validation do
    self.description = '' unless self.description.present?
  end
end
