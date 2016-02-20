require 'rails_helper'

RSpec.describe RoomThing, :type => :model do
  it 'can be instantiated' do
    expect(RoomThing.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:room_thing)).to be_persisted
    expect(create(:room_thing)).to be_persisted
  end
end
