class MagicItem < Thing

  def activates_on
    [ ACTIVATE_USE, ACTIVATE_PICKUP, ACTIVATE_DROP ]
  end
end
