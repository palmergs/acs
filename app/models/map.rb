# frozen_string_literal: true

class Map < ApplicationRecord
  belongs_to :adventure
  
  has_many :map_regions, dependent: :destroy
  has_many :regions, through: :map_regions

  has_many :terrains, dependent: :destroy
end
