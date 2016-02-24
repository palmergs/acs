require 'rails_helper'

RSpec.describe Armor, as: :model do
  it 'can be instantiated' do
    expect(Armor.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:armor)).to be_persisted
    expect(create(:armor)).to be_persisted
  end
end
