require 'rails_helper'

RSpec.describe "trainbots/index", type: :view do
  before(:each) do
    assign(:trainbots, [
      Trainbot.create!(
        message: "MyText",
        intent: "Intent",
        entity: "Entity",
        start: "Start",
        end: "End",
        body: "Body"
      ),
      Trainbot.create!(
        message: "MyText",
        intent: "Intent",
        entity: "Entity",
        start: "Start",
        end: "End",
        body: "Body"
      )
    ])
  end

  it "renders a list of trainbots" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Intent".to_s, count: 2
    assert_select "tr>td", text: "Entity".to_s, count: 2
    assert_select "tr>td", text: "Start".to_s, count: 2
    assert_select "tr>td", text: "End".to_s, count: 2
    assert_select "tr>td", text: "Body".to_s, count: 2
  end
end
