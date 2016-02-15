require 'rails_helper'

RSpec.describe Map, :type => :model do
  it 'can be instantiated' do
    expect(Map.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:map)).to be_persisted
    expect(create(:map)).to be_persisted
  end
end
