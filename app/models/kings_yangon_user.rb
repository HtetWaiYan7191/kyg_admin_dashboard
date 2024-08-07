class KingsYangonUser < ApplicationRecord
    paginates_per 4 

    validates :school_id, uniqueness: true, presence: true
end
