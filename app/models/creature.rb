# frozen_string_literal: true

class Creature < ApplicationRecord
  NPC = 'npc'
  PLAYER = 'player'
  CATEGORIES = [NPC, PLAYER].freeze

  NO_MAGICAL_DEFENSE = 'none'
  PARTIAL_MAGICAL_DEFENSE = 'partial'
  FULL_MAGICAL_DEFENSE = 'full'
  MAGICAL_DEFENSES = [NO_MAGICAL_DEFENSE, PARTIAL_MAGICAL_DEFENSE, FULL_MAGICAL_DEFENSE].freeze

  BRAVE = 'Brave'
  CAUTIOUS = 'Cautious'
  PERSONALITIES = [BRAVE, CAUTIOUS].freeze

  AGGRESSIVE = 'Aggressive'
  PEACEFUL = 'Peaceful'
  OUTLOOKS = [AGGRESSIVE, PEACEFUL].freeze

  ENEMY = 'Enemy'
  FRIENDLY = 'Friendly'
  NEUTRAL = 'Neutral'
  THIEF = 'Thief'
  ALLIANCES = [ENEMY, FRIENDLY, NEUTRAL, THIEF].freeze

  belongs_to :adventure

  has_many :creature_things, dependent: :destroy
  has_many :things, through: :creature_things

  has_many :actors, dependent: :destroy

  scope :in_adventure, ->(filters) {
    where(adventure_id: filters[:adventure])
  }

  scope :by_name, ->(filters) {
    where('creatures.name like ?', "#{ filters[:name] }%") if filters[:name].present?
  }

  before_validation(on: :create) do 
    self.category = NPC unless self.category
  end
end
