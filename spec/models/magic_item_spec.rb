require 'rails_helper'

RSpec.describe MagicItem, as: :model do
  it 'can be instantiated' do
    expect(MagicItem.new).to_not be_nil
  end

  it 'can be peristed' do
    expect(create(:magic_item)).to be_persisted
    expect(create(:magic_item)).to be_persisted
  end

  it 'is a subclass of Treasure' do
    expect(build(:magic_item)).to be_a Treasure
  end
end
