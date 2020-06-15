require 'rails_helper'

RSpec.describe 'home/about.html.haml', type: :view do
  it 'can render' do
    render
    expect(rendered).to match(/About/)
  end
end
