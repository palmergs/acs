class Region < ApplicationRecord
  include Concerns::HasName

  belongs_to :map

  has_many :rooms

  has_one :adventure, through: :map

  validates :width, numericality: { only_integer: true, greater_than: 2, less_than: 1000 }
  validates :height, numericality: { only_integer: true, greater_than: 2, less_than: 1000 }

  before_validation do
    self.description = '' unless self.description.present?
  end
end
