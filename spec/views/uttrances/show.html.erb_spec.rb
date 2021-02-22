require 'rails_helper'

RSpec.describe "uttrances/show", type: :view do
  before(:each) do
    @uttrance = assign(:uttrance, Uttrance.create!(
      message: "MyText",
      confidence: "Confidence"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Confidence/)
  end
end
