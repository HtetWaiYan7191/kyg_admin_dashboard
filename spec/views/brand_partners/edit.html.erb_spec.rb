require 'rails_helper'

RSpec.describe "brand_partners/edit", type: :view do
  let(:brand_partner) {
    BrandPartner.create!(
      name: "MyString",
      brand_category: nil,
      image: nil
    )
  }

  before(:each) do
    assign(:brand_partner, brand_partner)
  end

  it "renders the edit brand_partner form" do
    render

    assert_select "form[action=?][method=?]", brand_partner_path(brand_partner), "post" do

      assert_select "input[name=?]", "brand_partner[name]"

      assert_select "input[name=?]", "brand_partner[brand_category_id]"

      assert_select "input[name=?]", "brand_partner[image]"
    end
  end
end
