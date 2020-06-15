# frozen_string_literal: true

class Thing < ApplicationRecord
  TREASURE = 'treasure'
  WEAPON = 'weapon'
  ARMOR = 'armor'
  CATEGORIES = [TREASURE, WEAPON, ARMOR].freeze

  belongs_to :adventure

  validates :name, presence: true
end
