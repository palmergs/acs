require 'rails_helper'

RSpec.describe MagicSpell, as: :model do
  it 'can be instantiated' do
    expect(MagicSpell.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:magic_spell)).to be_persisted
    expect(create(:magic_spell)).to be_persisted
  end
end
