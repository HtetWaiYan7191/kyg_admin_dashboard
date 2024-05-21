require 'rails_helper'

RSpec.describe "brand_categories/edit", type: :view do
  let(:brand_category) {
    BrandCategory.create!(
      name: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:brand_category, brand_category)
  end

  it "renders the edit brand_category form" do
    render

    assert_select "form[action=?][method=?]", brand_category_path(brand_category), "post" do

      assert_select "input[name=?]", "brand_category[name]"

      assert_select "input[name=?]", "brand_category[description]"
    end
  end
end
