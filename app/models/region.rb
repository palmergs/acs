class Region < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  belongs_to :map

  has_many :rooms

  has_one :adventure, through: :map

  validates :width, numericality: { only_integer: true, greater_than: 2, less_than: 1000 }
  validates :height, numericality: { only_integer: true, greater_than: 2, less_than: 1000 }
end
