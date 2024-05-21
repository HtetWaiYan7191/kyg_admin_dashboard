require 'rails_helper'

RSpec.describe "brand_partners/index", type: :view do
  before(:each) do
    assign(:brand_partners, [
      BrandPartner.create!(
        name: "Name",
        brand_category: nil,
        image: nil
      ),
      BrandPartner.create!(
        name: "Name",
        brand_category: nil,
        image: nil
      )
    ])
  end

  it "renders a list of brand_partners" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
