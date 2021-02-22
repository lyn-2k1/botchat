require 'rails_helper'

RSpec.describe "trainbots/edit", type: :view do
  before(:each) do
    @trainbot = assign(:trainbot, Trainbot.create!(
      message: "MyText",
      intent: "MyString",
      entity: "MyString",
      start: "MyString",
      end: "MyString",
      body: "MyString"
    ))
  end

  it "renders the edit trainbot form" do
    render

    assert_select "form[action=?][method=?]", trainbot_path(@trainbot), "post" do

      assert_select "textarea[name=?]", "trainbot[message]"

      assert_select "input[name=?]", "trainbot[intent]"

      assert_select "input[name=?]", "trainbot[entity]"

      assert_select "input[name=?]", "trainbot[start]"

      assert_select "input[name=?]", "trainbot[end]"

      assert_select "input[name=?]", "trainbot[body]"
    end
  end
end
