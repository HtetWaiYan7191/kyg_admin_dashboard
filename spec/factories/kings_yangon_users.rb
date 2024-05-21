require 'faker'

FactoryBot.define do 
    factory :kings_yangon_user do 
        sequence(:school_id) { |n| "school_#{n}" } # unique school_id
        password { Faker::Internet.password(min_length: 8) }
    end
end