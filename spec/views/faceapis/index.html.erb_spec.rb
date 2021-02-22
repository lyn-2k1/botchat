require 'rails_helper'

RSpec.describe "faceapis/index", type: :view do
  before(:each) do
    assign(:faceapis, [
      Faceapi.create!(
        message: "Message",
        id: "Id",
        pheduyet: false
      ),
      Faceapi.create!(
        message: "Message",
        id: "Id",
        pheduyet: false
      )
    ])
  end

  it "renders a list of faceapis" do
    render
    assert_select "tr>td", text: "Message".to_s, count: 2
    assert_select "tr>td", text: "Id".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
