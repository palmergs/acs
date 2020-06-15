require 'rails_helper'

RSpec.describe Map, type: :model do
  it 'can be persited' do
    expect(create(:map)).to be_persisted
    expect(create(:map)).to be_persisted
  end
end
