require 'rails_helper'

RSpec.describe Portal, as: :model do
  it 'can be instantiated' do
    expect(Portal.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:portal)).to be_persisted
    expect(create(:portal)).to be_persisted
  end

  it 'is a subclass of FixedThing' do
    expect(build(:portal)).to be_a FixedThing
  end
end
