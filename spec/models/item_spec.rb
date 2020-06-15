require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'can be persisted' do
    expect(create(:item)).to be_persisted
    expect(create(:item)).to be_persisted
  end

  describe 'validations' do
    it 'is not valid without a room or an actor (but not both)' do
      expect(build(:item, room: create(:room))).to be_valid
      expect(build(:item, actor: create(:actor))).to be_valid
      expect(build(:item, room: create(:room), actor: create(:actor))).to_not be_valid
    end
  end
end
