require 'rails_helper'

RSpec.describe "banners/show", type: :view do
  before(:each) do
    assign(:banner, Banner.create!(
      caption: "Caption"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Caption/)
  end
end
