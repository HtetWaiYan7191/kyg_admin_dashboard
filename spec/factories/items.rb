require 'faker' 

FactoryBot.define do
  factory :item do
    name { "MyString" }
    content { "MyText" }
    price { 9.99 }
    discount_percentage { 9.99 }
    association :brand_partner
    images { nil }
  end
end
