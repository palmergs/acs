class Actor < ApplicationRecord
  include Concerns::HasCreatureAttributes
  include Concerns::HasStrategy
  include Concerns::HasLocation

  belongs_to :room
  belongs_to :creature

  has_many :items

  def readied_weapon
    items.find_by(readied: true, type: 'Weapon')
  end

  def ready_weapon= weapon
    if weapon.actor == self && weapon.is_a?(Weapon)
      old = items.find_by(readied: true, type: 'Weapon')
      old.update_attribute(readied: false) if old
      weapon.update_attribute(readied: true)
    end
  end  

  def readied_armor
    items.find_by(readied: true, type: 'Armor')
  end

  def ready_armor= armor
    if armor.actor == self && armor.is_a?(Armor)
      old = items.find_by(readied: true, type: 'Armor')
      old.update_attribute(readied: false) if old
      armor.update_attribute(readied: true)
    end
  end
end
