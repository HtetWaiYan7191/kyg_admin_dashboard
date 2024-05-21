require 'rails_helper'
require 'spec_helper' 

RSpec.describe 'Users factory' do 
    it 'create a valid user' do 
        user = build(:user)
        expect(user).to be_valid 
    end

    it 'create invalid user' do 
        user = build(:user, email: nil)
        expect(user).not_to be_valid
    end

    it ' role is allowed to be blank ' do 
        user = build(:user, role: '')
        expect(user).to be_valid
    end

    it 'role cannot be other than except values from enum' do 
        user = build(:user, role: 1)
        expect(user).to be_valid
    end
end