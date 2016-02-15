require 'rails_helper'

RSpec.describe Region, :type => :model do
  it 'can be instantiated' do
    expect(Region.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:region)).to be_persisted
    expect(create(:region)).to be_persisted
  end
end
