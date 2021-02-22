require 'rails_helper'

RSpec.describe "lists/new", type: :view do
  before(:each) do
    assign(:list, List.new(
      keyword: "MyString",
      synonyms: "MyText",
      entities: "MyString"
    ))
  end

  it "renders new list form" do
    render

    assert_select "form[action=?][method=?]", lists_path, "post" do

      assert_select "input[name=?]", "list[keyword]"

      assert_select "textarea[name=?]", "list[synonyms]"

      assert_select "input[name=?]", "list[entities]"
    end
  end
end
