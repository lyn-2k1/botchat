require 'rails_helper'

RSpec.describe "faceapis/show", type: :view do
  before(:each) do
    @faceapi = assign(:faceapi, Faceapi.create!(
      message: "Message",
      id: "Id",
      pheduyet: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Message/)
    expect(rendered).to match(/Id/)
    expect(rendered).to match(/false/)
  end
end
