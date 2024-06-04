class Banner < ApplicationRecord
    paginates_per 4 

    has_one_attached :image
end
