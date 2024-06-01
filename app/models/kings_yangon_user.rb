class KingsYangonUser < ApplicationRecord
    has_secure_password
    paginates_per 4 

    validates :school_id, uniqueness: true, presence: true
    validates :password, presence: true, length: { minimum: 8 }
end
