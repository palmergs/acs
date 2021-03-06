# frozen_string_literal: true

class Adventure < ApplicationRecord
  include HasSlug

  belongs_to :sprite_map
  has_many :maps, dependent: :destroy
  has_many :regions, dependent: :destroy
  has_many :things, dependent: :destroy
  has_many :creatures, dependent: :destroy

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

  validates :name, :slug, presence: true
  validates :genre, presence: true, inclusion: { in: GENRE }
  validates :rating, presence: true, inclusion: { in: RATING }
  validates :access, presence: true, inclusion: { in: ACCESS }

  before_validation(on: :create) do
    self.slug = name.downcase.strip.gsub(/[\s[:punct:]]+/, '-')
    self.sprite_map = SpriteMap.find_by(name: genre) unless sprite_map_id
    Rails.logger.debug("GENRE=#{ genre } SPRITES=#{ SpriteMap.find_by(name: genre) }")
  end

  scope :by_rating, ->(rating) {
    where(rating: rating) if rating
  }
end
