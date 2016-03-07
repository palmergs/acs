module Concerns
  module HasCreatureAttributes
    extend ActiveSupport::Concern

    MAGIC_NONE = 'none'
    MAGIC_HALF = 'half'
    MAGIC_FULL = 'full'
    MAGICAL_DEFENSES = [ MAGIC_NONE, MAGIC_HALF, MAGIC_FULL ]

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

      validates :speed, presence: true,
          numericality: { greater_than_or_equal_to: 0, less_than: 16 }

      validates :life_force, presence: true,
          numericality: { greater_than_or_equal_to: 0, less_than: 64 }

      validates :power, presence: true,
          numericality: { greater_than_or_equal_to: 0, less_than: 128 }

      validates :constitution, :wisdom, :strength, :size, :dexterity,
          presence: true,
          numericality: { greater_than_or_equal_to: 0, less_than: 32 }

      validates :melee_skill, :armor_skill, :missile_skill, :parry_skill, :dodge_skill,
          presence: true,
          numericality: { greater_than_or_equal_to: 0, less_than: 128 }

      validates :magical_defense, presence: true, inclusion: { in: MAGICAL_DEFENSES }

    end

    def smart?
      if wisdom > 14
        true
      elsif wisdom < 7
        false
      else
        rand < (0.1111 * (wisdom - 6))
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
