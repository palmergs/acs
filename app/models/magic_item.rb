class MagicItem < Treasure

  def can_activate_on
    [ ACTIVATE_USE, ACTIVATE_PICKUP, ACTIVATE_DROP ]
  end
end
