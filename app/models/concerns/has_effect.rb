module Concerns
  module HasEffect
    extend ActiveSupport::Concern

    ACTIVATE_NONE = "none"
    ACTIVATE_BUMP = "bump"
    ACTIVATE_OVER = "over"
    ACTIVATE_PICKUP = "pick up"
    ACTIVATE_USE = "use"
    ACTIVATE_DROP = "drop"

    EFFECT_KILL_ALL_BUT_OWNER_OF = "Kill All"
    EFFECT_SUMMON_BANISH_CREATURE = "Summon/Banish"
    EFFECT_INCREASE_MAGICAL_DEFENSE = "Increase Magical Defense"
    EFFECT_DECREASE_MAGICAL_DEFENSE = "Decrease Magical Defense"
    EFFECT_INCREASE_ATTRIBUTE = "Increase Attribute"
    EFFECT_DECREASE_ATTRIBUTE = "Decrease Attribute"
    EFFECT_CHANGE_POWER = "Change Power"
    EFFECT_CHANGE_LIFE_FORCE = "Change Life Force"
    EFFECT_GIVE_ONE = "Give One"
    EFFECT_DISPLAY_MESSAGE = "Display Message"
    EFFECT_PLAY_MUSIC = "Play Music"
    EFFECT_RID_ROOM = "Rid Room Of All"
    EFFECT_ADD_ONE_TO_ROOM = "Add to Room One"
    EFFECT_ACTIVATE_ALL_THINGS = "Activate All Things"

    included do
      has_one :affected_thing, class_name: 'Thing', foreign_key: :acts_on_thing_id, primary_key: :id
      has_one :affected_creature, class_name: 'Creature', foreign_key: :acts_on_creature_id, primary_key: :id
    end

  end
end
