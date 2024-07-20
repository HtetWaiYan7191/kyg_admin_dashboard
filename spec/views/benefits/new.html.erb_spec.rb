require 'rails_helper'

RSpec.describe "benefits/new", type: :view do
  before(:each) do
    assign(:benefit, Benefit.new())
  end

  it "renders new benefit form" do
    render

    assert_select "form[action=?][method=?]", benefits_path, "post" do
    end
  end
end
