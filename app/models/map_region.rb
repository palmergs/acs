# frozen_string_literal: true

# MapRegion defines a gateway from a map to a place on
# a region. To travel the other direction requires a
# specific tile type which may or may not have various
# triggers.
class MapRegion < ApplicationRecord
  AUTO_TRAVEL = 'auto-travel'
  ASK_BEFORE = 'ask-before'
  MAP_TO_REGION = [AUTO_TRAVEL, ASK_BEFORE].freeze

  belongs_to :map
  belongs_to :region
end
