require 'rails_helper'

RSpec.describe "uttrances/edit", type: :view do
  before(:each) do
    @uttrance = assign(:uttrance, Uttrance.create!(
      message: "MyText",
      confidence: "MyString"
    ))
  end

  it "renders the edit uttrance form" do
    render

    assert_select "form[action=?][method=?]", uttrance_path(@uttrance), "post" do

      assert_select "textarea[name=?]", "uttrance[message]"

      assert_select "input[name=?]", "uttrance[confidence]"
    end
  end
end
