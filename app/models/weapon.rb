class Weapon < Thing

  def missile_weapon?
    range > 0
  end

  def melee_weapon?
    range == 0
  end

end
