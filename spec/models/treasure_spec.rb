require 'rails_helper'

RSpec.describe Treasure, as: :model do
  it 'can be instantiated' do
    expect(Treasure.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:treasure)).to be_persisted
    expect(create(:treasure)).to be_persisted
  end

end
