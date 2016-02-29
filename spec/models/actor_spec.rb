require 'rails_helper'

RSpec.describe Actor, :type => :model do
  it 'can be instantiated' do
    expect(Actor.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:actor)).to be_persisted
    expect(create(:actor)).to be_persisted
  end

  describe 'attributes' do
    it 'is smart if wisdom is greater than 14' do
      expect(build(:actor, wisdom: 15)).to be_smart
    end

    it 'is not smart if wisdom is less than 7' do
      expect(build(:actor, wisdom: 6)).to_not be_smart
    end

    it 'is sometimes smart if wisdom is in between' do

      actor = build(:actor, wisdom: 14)
      sum1 = (0..100).inject(0) {|s,n| s + (actor.smart? ? 1 : 0) }
      expect(sum1).to be < 100

      actor = build(:actor, wisdom: 7)
      sum2 = (0..100).inject(0) {|s,n| s + (actor.smart? ? 1 : 0) }
      expect(sum2).to be > 0
      expect(sum1).to be > sum2 # smarter creatures should be smart more often
    end
  end

  describe 'strategy' do
    it 'has a fighter strategy' do
      a = build(:actor, outlook: Concerns::HasStrategy::OUTLOOK_AGGRESSIVE)
      expect(a.strategy).to be_a Strategy
    end

    it 'has a slinker strategy' do
      a = build(:actor, outlook: Concerns::HasStrategy::OUTLOOK_PEACEFUL)
      expect(a.strategy).to be_a Strategy
    end
  end
end
