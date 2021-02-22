require 'rails_helper'

RSpec.describe "uttrances/new", type: :view do
  before(:each) do
    assign(:uttrance, Uttrance.new(
      message: "MyText",
      confidence: "MyString"
    ))
  end

  it "renders new uttrance form" do
    render

    assert_select "form[action=?][method=?]", uttrances_path, "post" do

      assert_select "textarea[name=?]", "uttrance[message]"

      assert_select "input[name=?]", "uttrance[confidence]"
    end
  end
end
