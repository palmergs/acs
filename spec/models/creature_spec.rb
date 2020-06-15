require 'rails_helper'

RSpec.describe Creature, type: :model do
  it 'can be persisted' do
    expect(create(:creature)).to be_persisted
  end
end
