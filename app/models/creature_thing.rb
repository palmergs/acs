class CreatureThing < ApplicationRecord
  belongs_to :creature
  belongs_to :thing

  validates :count, numericality: { greater_than_or_equal_to: 1 }
end
