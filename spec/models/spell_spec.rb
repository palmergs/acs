require 'rails_helper'

RSpec.describe Spell, :type => :model do
  it 'can be instantiated' do
    expect(Spell.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:spell)).to be_persisted
    expect(create(:spell)).to be_persisted
  end
end
