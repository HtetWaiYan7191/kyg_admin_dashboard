require 'rails_helper' 

RSpec.describe 'Kings Yangon Users Factories ' do 
    it 'should create a valid user' do 
        kyg_user = build(:kings_yangon_user)
        expect(kyg_user).to be_valid
    end

    it 'return the invalid user' do 
        kyg_user = build(:kings_yangon_user, school_id: nil)
        expect(kyg_user).not_to be_valid
    end

    it 'password length too short' do 
        kyg_user = build(:kings_yangon_user, password: '123')
        expect(kyg_user).not_to be_valid
    end
end