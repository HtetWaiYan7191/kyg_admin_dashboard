require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) {build(:item)}

  it 'should create a valid item ' do 
    expect(item).to be_valid
  end

  it 'name should be presence ' do 
    item.name = nil 
    expect(item).not_to be_valid
  end

  it 'price should be integer' do 
    item.price = nil 
    expect(item).not_to be_valid
    item.price = 12 
    expect(item).to be_valid
  end

  it 'brand partner should be presence ' do 
    item.brand_partner = nil 
    expect(item).not_to be_valid
  end
end
