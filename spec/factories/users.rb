require 'faker' 

FactoryBot.define do 
    factory :user do
        email { Faker::Internet.unique.email }
        password { Faker::Internet.password(min_length: 8)}
        name { Faker::Name.name }
        department { Faker::Company.industry }
        title { Faker::Job.title }
        position { Faker::Job.position }
        role { 0 } # default role, can be adjusted as needed
        # optional fields
        reset_password_token { nil }
        reset_password_sent_at { nil }
        remember_created_at { nil }
      end
end