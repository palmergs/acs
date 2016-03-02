require 'rails_helper'

RSpec.describe Store, as: :model do
  it 'can be instantiated' do
    expect(Store.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:store)).to be_persisted
    expect(create(:store)).to be_persisted
  end

  it 'is a subclass of FixedThing' do
    expect(build(:store)).to be_a FixedThing
  end
end
