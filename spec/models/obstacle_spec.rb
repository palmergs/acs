require 'rails_helper'

RSpec.describe Obstacle, as: :model do
  it 'can be instantiated' do
    expect(Obstacle.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:obstacle)).to be_persisted
    expect(create(:obstacle)).to be_persisted
  end

  it 'is a subclass of FixedThing' do
    expect(build(:obstacle)).to be_a FixedThing
  end
end
