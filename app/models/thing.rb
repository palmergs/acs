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
end
