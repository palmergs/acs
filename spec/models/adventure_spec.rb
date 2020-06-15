require 'rails_helper'

RSpec.describe Adventure, type: :model do
  it 'can be persisted' do
    expect(create(:adventure)).to be_persisted
    expect(create(:adventure)).to be_persisted
  end

  describe 'scopes' do
    it 'can be queried by rating' do
      adv = create(:adventure, rating: Adventure::GENERAL)

      expect(Adventure.by_rating(nil)).to include(adv)
      expect(Adventure.by_rating(Adventure::KIDS)).to_not include(adv)
      expect(Adventure.by_rating(Adventure::GENERAL)).to include(adv)
    end
  end
end
