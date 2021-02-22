require 'rails_helper'

RSpec.describe "faceapis/edit", type: :view do
  before(:each) do
    @faceapi = assign(:faceapi, Faceapi.create!(
      message: "MyString",
      id: "MyString",
      pheduyet: false
    ))
  end

  it "renders the edit faceapi form" do
    render

    assert_select "form[action=?][method=?]", faceapi_path(@faceapi), "post" do

      assert_select "input[name=?]", "faceapi[message]"

      assert_select "input[name=?]", "faceapi[id]"

      assert_select "input[name=?]", "faceapi[pheduyet]"
    end
  end
end
