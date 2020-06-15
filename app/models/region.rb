# frozen_string_literal: true

# Region defines a collection of rooms that are connected
# by doors in the walls (I know that sounds obvious, but basing
# this on ACS that's the best definition I could come up with)
class Region < ApplicationRecord
  belongs_to :adventure

  # Ways to get to this region from one or more maps
  has_many :map_regions

  # Individual rooms within a region. They may not overlap.
  has_many :rooms
end
