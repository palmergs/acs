require 'rails_helper'

RSpec.describe Room, :type => :model do
  it 'can be instantiated' do
    expect(Room.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:room)).to be_persisted
    expect(create(:room)).to be_persisted
  end
end
