require 'rails_helper'

RSpec.describe Creature, :type => :model do
  it 'can be instantiated' do
    expect(Creature.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:creature)).to be_persisted
    expect(create(:creature)).to be_persisted
  end
end
