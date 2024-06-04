require 'rails_helper'

RSpec.describe "banners/index", type: :view do
  before(:each) do
    assign(:banners, [
      Banner.create!(
        caption: "Caption"
      ),
      Banner.create!(
        caption: "Caption"
      )
    ])
  end

  it "renders a list of banners" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Caption".to_s), count: 2
  end
end
