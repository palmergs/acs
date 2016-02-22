require 'rails_helper'

RSpec.describe Actor, :type => :model do
  it 'can be instantiated' do
    expect(Actor.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:actor)).to be_persisted
    expect(create(:actor)).to be_persisted
  end
end
