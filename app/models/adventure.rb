# frozen_string_literal: true

class Adventure < ApplicationRecord
  include HasSlug

  belongs_to :sprite_map
  has_many :maps
  has_many :regions

  PUBLIC = 'public'
  PRIVATE = 'private'
  ACCESS = [PUBLIC, PRIVATE].freeze

  FANTASY = 'fantasy'
  SPY = 'spy'
  SCIFI = 'scifi'
  GENRE = [FANTASY, SPY, SCIFI].freeze

  KIDS = 'kids'
  GENERAL = 'general'
  SERIOUS = 'serious'
  RATING = [KIDS, GENERAL, SERIOUS].freeze

  scope :by_rating, ->(rating) {
    where(rating: rating) if rating
  }
end
