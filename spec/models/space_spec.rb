require 'rails_helper'

RSpec.describe Space, as: :model do
  it 'can be instantiated' do
    expect(Space.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:space)).to be_persisted
    expect(create(:space)).to be_persisted
  end
end
