class Treasure < Thing

  before_validation do
    self.power = 0 unless self.power
    self.attack_adj = 0 unless self.attack_adj
    self.breakability = 0 unless self.breakability
    self.magic = false unless self.magic
    self.range = 0 unless self.range
    self.activate_on = ACTIVATE_NONE unless self.activate_on
    self.power_cost = 0 unless self.power_cost
  end
end
