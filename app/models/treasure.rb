class Treasure < Thing

  before_validation do
    self.power = 0
    self.attack_adj = 0
    self.breakability = 0
    self.magic = false
    self.owner_only = false
    self.range = 0
    self.activate_on = ACTIVATE_NONE
    self.power_cost = 0
  end
end
