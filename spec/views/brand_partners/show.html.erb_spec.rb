require 'rails_helper'

RSpec.describe "brand_partners/show", type: :view do
  before(:each) do
    assign(:brand_partner, BrandPartner.create!(
      name: "Name",
      brand_category: nil,
      image: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
