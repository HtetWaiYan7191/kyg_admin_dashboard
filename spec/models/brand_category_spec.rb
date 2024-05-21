require 'rails_helper'

RSpec.describe BrandCategory, type: :model do
  it 'should create a valid brand category' do 
    brand_category = build(:brand_category)
    expect(brand_category).to be_valid
  end
end
