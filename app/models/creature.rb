class Creature < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription
  include Concerns::HasCreatureAttributes
  include Concerns::HasStrategy

  belongs_to :adventure
  belongs_to :tile_picture

  has_many :actors, dependent: :destroy
  has_many :rooms, through: :actors

  has_many :creature_things, dependent: :destroy
  has_many :things, through: :creature_things

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
