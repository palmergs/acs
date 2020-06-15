require 'rails_helper'

RSpec.describe MapRegion, type: :model do
  it 'can be persisted' do
    expect(create(:map_region)).to be_persisted
    expect(create(:map_region)).to be_persisted
  end
end
