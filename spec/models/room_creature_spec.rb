require 'rails_helper'

RSpec.describe RoomCreature, :type => :model do
  it 'can be instantiated' do
    expect(RoomCreature.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:room_creature)).to be_persisted
    expect(create(:room_creature)).to be_persisted
  end
end
