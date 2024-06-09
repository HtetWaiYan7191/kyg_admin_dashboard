class Category < ApplicationRecord
    has_many :blogs

    paginates_per 4 

end
