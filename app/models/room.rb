class Room < ApplicationRecord
  belongs_to :region

  has_many :items, dependent: :destroy
  has_many :actors, dependent: :destroy

  validates :name, presence: true
end
