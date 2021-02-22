require 'rails_helper'

RSpec.describe "facebookapis/show", type: :view do
  before(:each) do
    @facebookapi = assign(:facebookapi, Facebookapi.create!(
      post: "Post",
      pheduyet: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Post/)
    expect(rendered).to match(/false/)
  end
end
