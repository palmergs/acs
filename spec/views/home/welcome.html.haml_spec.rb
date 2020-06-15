require 'rails_helper'

RSpec.describe 'home/welcome.html.haml', type: :view do
  it 'can render' do
    # assign(:current_user, stub_model(User))
    render
    expect(rendered).to match(/Welcome/)
  end
end
