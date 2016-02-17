require 'rails_helper'

RSpec.describe TilePicture, :type => :model do
  it 'can be instantiated' do
    expect(TilePicture.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:tile_picture)).to be_persisted
    expect(create(:tile_picture)).to be_persisted
  end
end
