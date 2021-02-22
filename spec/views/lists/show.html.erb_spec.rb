require 'rails_helper'

RSpec.describe "lists/show", type: :view do
  before(:each) do
    @list = assign(:list, List.create!(
      keyword: "Keyword",
      synonyms: "MyText",
      entities: "Entities"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Keyword/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Entities/)
  end
end
