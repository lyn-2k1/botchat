require 'rails_helper'

RSpec.describe "facebookapis/edit", type: :view do
  before(:each) do
    @facebookapi = assign(:facebookapi, Facebookapi.create!(
      post: "MyString",
      pheduyet: false
    ))
  end

  it "renders the edit facebookapi form" do
    render

    assert_select "form[action=?][method=?]", facebookapi_path(@facebookapi), "post" do

      assert_select "input[name=?]", "facebookapi[post]"

      assert_select "input[name=?]", "facebookapi[pheduyet]"
    end
  end
end
