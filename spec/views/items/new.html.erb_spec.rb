require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      name: "MyString",
      content: "MyText",
      price: "9.99",
      discount_percentage: "9.99",
      brand_partner: nil,
      images: nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "textarea[name=?]", "item[content]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[discount_percentage]"

      assert_select "input[name=?]", "item[brand_partner_id]"

      assert_select "input[name=?]", "item[images]"
    end
  end
end
