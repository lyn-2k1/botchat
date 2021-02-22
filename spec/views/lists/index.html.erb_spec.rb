require 'rails_helper'

RSpec.describe "lists/index", type: :view do
  before(:each) do
    assign(:lists, [
      List.create!(
        keyword: "Keyword",
        synonyms: "MyText",
        entities: "Entities"
      ),
      List.create!(
        keyword: "Keyword",
        synonyms: "MyText",
        entities: "Entities"
      )
    ])
  end

  it "renders a list of lists" do
    render
    assert_select "tr>td", text: "Keyword".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Entities".to_s, count: 2
  end
end
