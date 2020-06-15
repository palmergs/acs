require 'rails_helper'

RSpec.describe CreatureThing, type: :model do
  it 'can be persisted' do
    expect(create(:creature_thing)).to be_persisted
    expect(create(:creature_thing)).to be_persisted
  end
end
