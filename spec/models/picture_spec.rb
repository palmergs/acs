require 'rails_helper'

RSpec.describe Picture, as: :model do
  it 'can be instantiated' do
    expect(Picture.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:picture)).to be_persisted
    expect(create(:picture)).to be_persisted
  end
end
