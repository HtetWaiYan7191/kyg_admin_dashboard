require 'rails_helper'

RSpec.describe "benefits/index", type: :view do
  before(:each) do
    assign(:benefits, [
      Benefit.create!(),
      Benefit.create!()
    ])
  end

  it "renders a list of benefits" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
