require 'rails_helper'

RSpec.describe Location, as: :model do

  it 'can be instantiated' do
    expect(Location.new(0, 0)).to_not be_nil
  end

  let(:location) { Location.new(4, 4) }

  describe 'distance' do
    it 'has a distance of 1 if adjacent' do
      locs = [ Location.new(5, 4), Location.new(4, 5), Location.new(3, 4), Location.new(4, 3) ]
      locs.each do |loc|
        expect(location.adjacent?(loc)).to be_truthy
        expect(loc.adjacent?(location)).to be_truthy
        expect(location.distance_to(loc)).to eq(1)
        expect(loc.distance_to(location)).to eq(1)
      end
    end

    it 'has a distance of 1 if directly diagonal' do
      locs = [ Location.new(3, 3), Location.new(5, 5), Location.new(3, 5), Location.new(5, 3) ]
      locs.each do |loc|
        expect(location.adjacent?(loc)).to be_falsey
        expect(loc.adjacent?(location)).to be_falsey
        expect(location.distance_to(loc)).to eq(1)
        expect(loc.distance_to(location)).to eq(1)
      end

    end
  end

  describe 'direction' do
    it 'describes NORTH as up' do
      expect(location.direction_to(Location.new(4, 3))).to be(Location::NORTH)
      expect(location.direction_to(Location.new(5, 0))).to be(Location::NORTH)
    end

    it 'describes WEST as left' do
      expect(location.direction_to(Location.new(3, 4))).to be(Location::WEST)
      expect(location.direction_to(Location.new(0, 3))).to be(Location::WEST)
    end

    it 'describes EAST as right' do
      expect(location.direction_to(Location.new(5, 4))).to be(Location::EAST)
      expect(location.direction_to(Location.new(8, 5))).to be(Location::EAST)
    end
  end

end
