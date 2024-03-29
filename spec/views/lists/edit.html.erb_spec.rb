require 'rails_helper'

RSpec.describe "lists/edit", type: :view do
  before(:each) do
    @list = assign(:list, List.create!(
      keyword: "MyString",
      synonyms: "MyText",
      entities: "MyString"
    ))
  end

  it "renders the edit list form" do
    render

    assert_select "form[action=?][method=?]", list_path(@list), "post" do

      assert_select "input[name=?]", "list[keyword]"

      assert_select "textarea[name=?]", "list[synonyms]"

      assert_select "input[name=?]", "list[entities]"
    end
  end
end
