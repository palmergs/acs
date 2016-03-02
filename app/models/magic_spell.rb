class MagicSpell < Thing

  before_validation do
    self.owner_only = true
  end
end
