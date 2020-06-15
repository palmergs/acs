require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'can be persisted' do
    expect(create(:actor)).to be_persisted
    expect(create(:actor)).to be_persisted
  end
end
