require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'can be persisted' do
    expect(create(:room)).to be_persisted
    expect(create(:room)).to be_persisted
  end
end
