# frozen_string_literal: true

class Map < ApplicationRecord
  belongs_to :adventure
  
  has_many :map_regions, dependent: :destroy
  has_many :regions, through: :map_regions

  has_many :terrains, dependent: :destroy

  scope :in_adventure, ->(filters) {
    where(adventure_id: filters[:adventure])
  }

  scope :by_name, ->(filters) {
    where('maps.name like ?', "#{ filters[:name] }%") if filters[:name].present?
  }
end
