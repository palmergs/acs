require 'rails_helper'

RSpec.describe StoreThing, :type => :model do
  it 'can be instantiated' do
    expect(StoreThing.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:store_thing)).to be_persisted
    expect(create(:store_thing)).to be_persisted
  end
end
