require 'rails_helper'

RSpec.describe "facebookapis/index", type: :view do
  before(:each) do
    assign(:facebookapis, [
      Facebookapi.create!(
        post: "Post",
        pheduyet: false
      ),
      Facebookapi.create!(
        post: "Post",
        pheduyet: false
      )
    ])
  end

  it "renders a list of facebookapis" do
    render
    assert_select "tr>td", text: "Post".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
