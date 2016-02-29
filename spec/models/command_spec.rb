require 'rails_helper'

RSpec.describe Command, as: :model do
  let(:actor) { create(:actor) }
  let(:item) { create(:item, actor: actor) }

  it 'can be instantiated with actor' do
    expect(Command.new(actor)).to_not be_nil
  end

  it 'can be instantiated with actor and item' do
    expect(Command.new(actor, item)).to_not be_nil
  end

  it 'can be instantiated with actor, item and location' do
    expect(Command.new(actor, item, 1, 2)).to_not be_nil
  end

end
