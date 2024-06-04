require 'rails_helper'

RSpec.describe "banners/edit", type: :view do
  let(:banner) {
    Banner.create!(
      caption: "MyString"
    )
  }

  before(:each) do
    assign(:banner, banner)
  end

  it "renders the edit banner form" do
    render

    assert_select "form[action=?][method=?]", banner_path(banner), "post" do

      assert_select "input[name=?]", "banner[caption]"
    end
  end
end
