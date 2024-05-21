require 'rails_helper'

RSpec.describe "brand_partners/new", type: :view do
  before(:each) do
    assign(:brand_partner, BrandPartner.new(
      name: "MyString",
      brand_category: nil,
      image: nil
    ))
  end

  it "renders new brand_partner form" do
    render

    assert_select "form[action=?][method=?]", brand_partners_path, "post" do

      assert_select "input[name=?]", "brand_partner[name]"

      assert_select "input[name=?]", "brand_partner[brand_category_id]"

      assert_select "input[name=?]", "brand_partner[image]"
    end
  end
end
