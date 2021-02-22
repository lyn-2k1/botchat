require 'rails_helper'

RSpec.describe "faceapis/new", type: :view do
  before(:each) do
    assign(:faceapi, Faceapi.new(
      message: "MyString",
      id: "MyString",
      pheduyet: false
    ))
  end

  it "renders new faceapi form" do
    render

    assert_select "form[action=?][method=?]", faceapis_path, "post" do

      assert_select "input[name=?]", "faceapi[message]"

      assert_select "input[name=?]", "faceapi[id]"

      assert_select "input[name=?]", "faceapi[pheduyet]"
    end
  end
end
