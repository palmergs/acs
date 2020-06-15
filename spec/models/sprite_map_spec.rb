require 'rails_helper'

RSpec.describe SpriteMap, type: :model do
  it 'can be persisted' do
    expect(create(:sprite_map)).to be_persisted
    expect(create(:sprite_map)).to be_persisted
  end
end
