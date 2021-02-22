require 'rails_helper'

RSpec.describe "trainbots/show", type: :view do
  before(:each) do
    @trainbot = assign(:trainbot, Trainbot.create!(
      message: "MyText",
      intent: "Intent",
      entity: "Entity",
      start: "Start",
      end: "End",
      body: "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Intent/)
    expect(rendered).to match(/Entity/)
    expect(rendered).to match(/Start/)
    expect(rendered).to match(/End/)
    expect(rendered).to match(/Body/)
  end
end
