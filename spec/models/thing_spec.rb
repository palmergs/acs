require 'rails_helper'

RSpec.describe Thing, type: :model do
  it 'can be persisted' do
    expect(create(:thing)).to be_persisted
  end
end
