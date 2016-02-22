module Concerns
  module HasCreatureAttributes
    extend ActiveSupport::Concern

    MAGIC_NONE = 'none'
    MAGIC_HALF = 'half'
    MAGIC_FULL = 'full'

    SKILL_ARMOR = "Armor Skill"
    SKILL_DODGE = "Dodge Skill"
    SKILL_MELEE = "Melee Skill"
    SKILL_MISSILE = "Missile Skill"

    ATTRIB_CONSTITUTION = "Constitution"
    ATTRIB_STRENGTH = "Strength"
    ATTRIB_DEXTERITY = "Dexterity"
    ATTRIB_SPEED = "Speed"
    ATTRIB_WISDOM = "Wisdom"
    ATTRIB_SIZE = "Size"

    included do

    end

    def smart?
      if wisdom > 14
        true
      elsif wisdom < 7
        false
      else
        rand(wisdom - 5) > 0
      end
    end

    def wounded?
      life_force < constitution
    end

    def unwounded?
      !wounded?
    end

  end
end
