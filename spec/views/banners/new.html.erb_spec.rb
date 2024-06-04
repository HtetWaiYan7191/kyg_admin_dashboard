require 'rails_helper'

RSpec.describe "banners/new", type: :view do
  before(:each) do
    assign(:banner, Banner.new(
      caption: "MyString"
    ))
  end

  it "renders new banner form" do
    render

    assert_select "form[action=?][method=?]", banners_path, "post" do

      assert_select "input[name=?]", "banner[caption]"
    end
  end
end
