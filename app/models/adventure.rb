# frozen_string_literal: true

class Adventure < ApplicationRecord
  include HasSlug

  belongs_to :sprite_map
  has_many :maps
  has_many :regions
  has_many :things

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
    self.slug = self.name.downcase.strip.gsub(/[\s[:punct:]]+/, '-')
    self.sprite_map = SpriteMap.order(created_at: :asc).first if self.sprite_map_id.nil?
  end

  scope :by_rating, ->(rating) {
    where(rating: rating) if rating
  }
end
