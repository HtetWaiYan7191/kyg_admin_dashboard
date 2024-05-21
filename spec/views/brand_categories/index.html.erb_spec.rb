require 'rails_helper'

RSpec.describe "brand_categories/index", type: :view do
  before(:each) do
    assign(:brand_categories, [
      BrandCategory.create!(
        name: "Name",
        description: "Description"
      ),
      BrandCategory.create!(
        name: "Name",
        description: "Description"
      )
    ])
  end

  it "renders a list of brand_categories" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
