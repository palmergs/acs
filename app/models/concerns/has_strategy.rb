module HasStrategy
  extend ActiveSupport::Concern

  PERSONALITY_BRAVE = 'brave'.freeze
  PERSONALITY_CAUTIOUS = 'cautious'.freeze

  OUTLOOK_AGGRESSIVE = 'aggressive'.freeze
  OUTLOOK_PEACEFUL = 'peaceful'.freeze

  ALLIANCE_ENEMY = 'enemy'.freeze
  ALLIANCE_FRIEND = 'friend'.freeze
  ALLIANCE_NEUTRAL = 'neutral'.freeze
  ALLIANCE_THIEF = 'thief'.freeze

  included do
    scope :enemies, -> { where(alliance: ALLIANCE_ENEMY) }
    scope :friends, -> { where(alliance: ALLIANCE_FRIEND) }
    scope :neutrals, -> { where(alliance: ALLIANCE_NEUTRAL) }
    scope :thiefs, -> { where(alliance: ALLIANCE_THIEF) }
  end

  def use_magic_item?
    smart?
  end

  def use_magic_spell?
    smart? && power > wisdom
  end

  def brave?
    personality == PERSONALITY_BRAVE
  end

  def aggressive?
    outlook == OUTLOOK_AGGRESSIVE
  end

  def peaceful?
    outlook == OUTLOOK_PEACEFUL
  end

  def fighter?
    aggressive? && (brave? || unwounded?)
  end

  def slinker?
    peaceful? && (cautious? || wounded?)
  end

  def strategy
    if fighter?
      fighter_strategy
    else
      slinker_strategy
    end
  end

  def fighter_strategy
    #    case alliance
    #    when ALLIANCE_ENEMY
    #      Strategy::EnemyFighter.new(self)
    #    when ALLIANCE_FRIEND
    #      Strategy::FriendlyFighter.new(self)
    #    when ALLIANCE_NEUTRAL
    #      Strategy::NeutralFighter.new(self)
    #    when ALLIANCE_THIEF
    #      Strategy::ThiefFighter.new(self)
    #    end
  end

  def slinker_strategy
    #    case alliance
    #    when ALLIANCE_ENEMY
    #      Strategy::EnemySlinker.new(self)
    #    when ALLIANCE_FRIEND
    #      Strategy::FriendlySlinker.new(self)
    #    when ALLIANCE_NEUTRAL
    #      Strategy::NeutralSlinker.new(self)
    #    when ALLIANCE_THIEF
    #      Strategy::ThiefSlinker.new(self)
    #    end
  end
end
