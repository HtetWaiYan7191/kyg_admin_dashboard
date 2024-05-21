require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  let(:item) {
    Item.create!(
      name: "MyString",
      content: "MyText",
      price: "9.99",
      discount_percentage: "9.99",
      brand_partner: nil,
      images: nil
    )
  }

  before(:each) do
    assign(:item, item)
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(item), "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "textarea[name=?]", "item[content]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[discount_percentage]"

      assert_select "input[name=?]", "item[brand_partner_id]"

      assert_select "input[name=?]", "item[images]"
    end
  end
end
