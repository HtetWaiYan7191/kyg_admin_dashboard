require 'rails_helper'

RSpec.describe "brand_categories/new", type: :view do
  before(:each) do
    assign(:brand_category, BrandCategory.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new brand_category form" do
    render

    assert_select "form[action=?][method=?]", brand_categories_path, "post" do

      assert_select "input[name=?]", "brand_category[name]"

      assert_select "input[name=?]", "brand_category[description]"
    end
  end
end
