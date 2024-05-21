require 'faker' 

FactoryBot.define do
  factory :brand_category do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs }
  end
end
