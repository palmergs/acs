require 'rails_helper'

RSpec.describe TerrainCreature, type: :model do
  it 'can be persisted' do
    expect(create(:terrain_creature)).to be_persisted
    expect(create(:terrain_creature)).to be_persisted
  end
end
