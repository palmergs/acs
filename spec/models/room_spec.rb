require 'rails_helper'

RSpec.describe Room, :type => :model do
  it 'can be instantiated' do
    expect(Room.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:room)).to be_persisted
    expect(create(:room)).to be_persisted
  end

  describe 'overlap detection' do
    it 'can check for complete match' do
      r1 = build(:room, width: 10, height: 10, x: 5, y: 5)
      r2 = build(:room, width: 10, height: 10, x: 5, y: 5)
      expect(r1.overlaps?(r2)).to be_truthy
      expect(r2.overlaps?(r1)).to be_truthy
    end

    it 'can check for corners' do
      r1 = build(:room, width: 10, height: 10, x: 5, y: 5)
      ul = build(:room, width: 3, height: 3, x: 3, y: 3)
      ur = build(:room, width: 3, height: 3, x: 14, y: 3)
      ll = build(:room, width: 3, height: 3, x: 3, y: 14)
      lr = build(:room, width: 3, height: 3, x: 14, y: 14)
      expect(r1.overlaps?(ul)).to be_truthy
      expect(r1.overlaps?(ur)).to be_truthy
      expect(r1.overlaps?(ll)).to be_truthy
      expect(r1.overlaps?(lr)).to be_truthy

      expect(ul.overlaps?(r1)).to be_truthy
      expect(ur.overlaps?(r1)).to be_truthy
      expect(ll.overlaps?(r1)).to be_truthy
      expect(lr.overlaps?(r1)).to be_truthy

      expect(ul.overlaps?(ur)).to be_falsey
      expect(ul.overlaps?(lr)).to be_falsey
      expect(ul.overlaps?(ll)).to be_falsey

      expect(ur.overlaps?(ul)).to be_falsey
      expect(ur.overlaps?(lr)).to be_falsey
      expect(ur.overlaps?(ll)).to be_falsey

      expect(ll.overlaps?(ul)).to be_falsey
      expect(ll.overlaps?(lr)).to be_falsey
      expect(ll.overlaps?(ur)).to be_falsey
    end

    it 'can check if no overlap' do
      r1 = build(:room, width: 5, height: 5, x: 5, y: 5)
      r2 = build(:room, width: 5, height: 5, x: 10, y: 10)
      expect(r1.overlaps?(r2)).to be_falsey
      expect(r2.overlaps?(r1)).to be_falsey
    end
  end
end
