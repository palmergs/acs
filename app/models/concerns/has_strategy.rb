module Concerns
  module HasStrategy
    extend ActiveSupport::Concern

    PERSONALITY_BRAVE = 'brave'
    PERSONALITY_CAUTIOUS = 'cautious'

    OUTLOOK_AGGRESSIVE = 'aggressive'
    OUTLOOK_PEACEFUL = 'peaceful'

    ALLIANCE_ENEMY = 'enemy'
    ALLIANCE_FRIEND = 'friend'
    ALLIANCE_NEUTRAL = 'neutral'
    ALLIANCE_THIEF = 'thief'

    included do
      scope :enemies, ->{ where(alliance: ALLIANCE_ENEMY) }
      scope :friends, ->{ where(alliance: ALLIANCE_FRIEND) }
      scope :neutrals, ->{ where(alliance: ALLIANCE_NEUTRAL) }
      scope :thiefs, ->{ where(alliance: ALLIANCE_THIEF) }
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
      if figher?
        fighter_strategy
      else
        slinker_strategy
      end
    end

    def fighter_stategy
      case alliance
      when ALLIANCE_ENEMY
      when ALLIANCE_FRIEND
      when ALLIANCE_NEUTRAL
      when ALLIANCE_THIEF
      end
    end

    def slinker_strategy
      case alliance
      when ALLIANCE_ENEMY
      when ALLIANCE_FRIEND
      when ALLIANCE_NEUTRAL
      when ALLIANCE_THIEF
      end
    end
  end
end
