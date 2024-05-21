
FactoryBot.define do
  factory :brand_partner do
    name { "brand partner 1 " }
    association :brand_category, factory: :brand_category
    image { nil }
  end
end
