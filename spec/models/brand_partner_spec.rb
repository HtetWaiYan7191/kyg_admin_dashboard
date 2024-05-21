require 'rails_helper'

RSpec.describe BrandPartner, type: :model do
  let(:brand_partner) {build(:brand_partner)}

  it 'should create a valid brand partner ' do 
    expect(brand_partner).to be_valid
  end

  it 'name should be presence' do 
    brand_partner.name = nil 
    expect(brand_partner).not_to be_valid
  end

  it ' category should be presence' do 
    brand_partner.brand_category = nil 
    expect(brand_partner).not_to be_valid
  end
end
