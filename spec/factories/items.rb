FactoryBot.define do
  factory :item do
    name { "MyString" }
    content { "MyText" }
    price { "9.99" }
    discount_percentage { "9.99" }
    brand_partner { nil }
    images { nil }
  end
end
