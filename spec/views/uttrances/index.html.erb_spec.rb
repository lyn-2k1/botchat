require 'rails_helper'

RSpec.describe "uttrances/index", type: :view do
  before(:each) do
    assign(:uttrances, [
      Uttrance.create!(
        message: "MyText",
        confidence: "Confidence"
      ),
      Uttrance.create!(
        message: "MyText",
        confidence: "Confidence"
      )
    ])
  end

  it "renders a list of uttrances" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Confidence".to_s, count: 2
  end
end
