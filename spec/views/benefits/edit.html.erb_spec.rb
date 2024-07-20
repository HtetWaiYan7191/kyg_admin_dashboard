require 'rails_helper'

RSpec.describe "benefits/edit", type: :view do
  let(:benefit) {
    Benefit.create!()
  }

  before(:each) do
    assign(:benefit, benefit)
  end

  it "renders the edit benefit form" do
    render

    assert_select "form[action=?][method=?]", benefit_path(benefit), "post" do
    end
  end
end
