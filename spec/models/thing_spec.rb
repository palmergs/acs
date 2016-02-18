require 'rails_helper'

RSpec.describe Thing, :type => :model do
  it 'can be instantiated' do
    expect(Thing.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:thing)).to be_persisted
    expect(create(:thing)).to be_persisted
  end

  describe 'scopes' do
    it 'can be searched by name' do
      t = create(:thing)
      expect(Thing.by_name(nil)).to include(t)
      expect(Thing.by_name('')).to include(t)
      expect(Thing.by_name('testing1235')).to_not include(t)
    end
  end
end
