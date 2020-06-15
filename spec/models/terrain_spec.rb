# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Terrain, type: :model do
  it 'can be persisted' do
    expect(create(:terrain)).to be_persisted
  end
end
