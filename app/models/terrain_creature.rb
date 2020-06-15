class TerrainCreature < ApplicationRecord
  belongs_to :terrain
  belongs_to :creature
end
