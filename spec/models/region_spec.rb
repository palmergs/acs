require 'rails_helper'

RSpec.describe Region, :type => :model do
  it 'can be instantiated' do
    expect(Region.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:region)).to be_persisted
    expect(create(:region)).to be_persisted
  end

  describe 'rooms' do
    it 'can have many rooms' do
      r = create(:region)
      expect(r.rooms.create(x: 1, y: 1, width: 5, height: 5, name: 'Room 1')).to be_valid
      expect(r.rooms.create(x: 6, y: 6, width: 5, height: 5, name: 'Room 2')).to be_valid
      expect(r.rooms.create(x: 3, y: 3, width: 5, height: 5, name: 'Room 3')).to_not be_valid
    end
  end
end
