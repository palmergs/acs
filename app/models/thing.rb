# frozen_string_literal: true

class Thing < ApplicationRecord
  TREASURE = 'treasure'
  WEAPON = 'weapon'
  ARMOR = 'armor'
  CATEGORIES = [TREASURE, WEAPON, ARMOR].freeze

  belongs_to :adventure

  has_many :creature_things, dependent: :destroy
  has_many :creatures, through: :creature_things

  has_many :items, dependent: :destroy

  validates :name, presence: true

  scope :in_adventure, ->(filters) {
    where(adventure_id: filters[:adventure])
  }

  scope :by_name, ->(filters) {
    where('things.name like ?', "#{ filters[:name] }%") if filters[:name].present?
  }
end
