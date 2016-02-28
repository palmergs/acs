class Space < FixedThing

  def can_activate_on
    [ ACTIVATE_ENTER, ACTIVATE_LEAVE ]
  end

end
