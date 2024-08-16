class KingsYangonUser < ApplicationRecord
    paginates_per 4 

    validates :school_id, uniqueness: true, presence: true, length: { in: 6..12 }
    
    enum user_type: {"student": 0, "teacher": 1, "staff": 2}
end
