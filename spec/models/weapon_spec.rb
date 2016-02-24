require 'rails_helper'

RSpec.describe Weapon, as: :model do
  it 'can be instantiated' do
    expect(Weapon.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:weapon)).to be_persisted
    expect(create(:weapon)).to be_persisted
  end

  context 'as a melee weapon' do
    let(:sword) { build(:weapon) }
    it 'is a melee weapon' do
      expect(sword).to be_melee_weapon
    end
  end

  context 'as a missile weapon' do
    let(:bow) { build(:weapon, range: 10) }
    it 'is a missile weapon' do
      expect(bow).to be_missile_weapon
    end
  end
end
