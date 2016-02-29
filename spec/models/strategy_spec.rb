require 'rails_helper'

RSpec.describe Strategy, as: :model do
  it 'can be instantiated with actor' do
    expect(Strategy.new(create(:actor))).to_not be_nil
  end
end
