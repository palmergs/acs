require 'rails_helper'

RSpec.describe Adventure, :type => :model do
  it 'can be instantiated' do
    expect(Adventure.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:adventure)).to be_persisted
    expect(create(:adventure)).to be_persisted
  end
end
