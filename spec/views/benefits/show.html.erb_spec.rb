require 'rails_helper'

RSpec.describe "benefits/show", type: :view do
  before(:each) do
    assign(:benefit, Benefit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
