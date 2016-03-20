require 'rails_helper'

RSpec.describe Adventure, :type => :model do
  it 'can be instantiated' do
    expect(Adventure.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:adventure)).to be_persisted
    expect(create(:adventure)).to be_persisted
  end

  describe 'map' do
    it 'automatically has a world mpa built on create' do
      expect(create(:adventure).map).to be_persisted
      expect(create(:adventure).map.name).to eq('World Map')
    end
  end
end
