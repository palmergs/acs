module HasEffect
  extend ActiveSupport::Concern

  ACTIVATE_NONE = 'none'.freeze
  ACTIVATE_BUMP = 'bump'.freeze
  ACTIVATE_OVER = 'over'.freeze
  ACTIVATE_PICKUP = 'pick up'.freeze
  ACTIVATE_USE = 'use'.freeze
  ACTIVATE_DROP = 'drop'.freeze

  EFFECT_KILL_ALL_BUT_OWNER_OF = 'Kill All'.freeze
  EFFECT_SUMMON_BANISH_CREATURE = 'Summon/Banish'.freeze
  EFFECT_INCREASE_MAGICAL_DEFENSE = 'Increase Magical Defense'.freeze
  EFFECT_DECREASE_MAGICAL_DEFENSE = 'Decrease Magical Defense'.freeze
  EFFECT_INCREASE_ATTRIBUTE = 'Increase Attribute'.freeze
  EFFECT_DECREASE_ATTRIBUTE = 'Decrease Attribute'.freeze
  EFFECT_CHANGE_POWER = 'Change Power'.freeze
  EFFECT_CHANGE_LIFE_FORCE = 'Change Life Force'.freeze
  EFFECT_GIVE_ONE = 'Give One'.freeze
  EFFECT_DISPLAY_MESSAGE = 'Display Message'.freeze
  EFFECT_PLAY_MUSIC = 'Play Music'.freeze
  EFFECT_RID_ROOM = 'Rid Room Of All'.freeze
  EFFECT_ADD_ONE_TO_ROOM = 'Add to Room One'.freeze
  EFFECT_ACTIVATE_ALL_THINGS = 'Activate All Things'.freeze
  EFFECT_PREVENT_ACCESS = 'Prevent Access'.freeze
  EFFECT_ALLOW_ACCESS = 'Allow Access'.freeze

  included do
    has_one :affected_thing, class_name: 'Thing', foreign_key: :acts_on_thing_id, primary_key: :id
    has_one :affected_creature, class_name: 'Creature', foreign_key: :acts_on_creature_id, primary_key: :id
  end
end
