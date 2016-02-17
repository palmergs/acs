require 'rails_helper'

RSpec.describe Terrain, :type => :model do
  it 'can be instantiated' do
    expect(Terrain.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:terrain)).to be_persisted
    expect(create(:terrain)).to be_persisted
  end
end
