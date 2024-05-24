class BrandCategory < ApplicationRecord
    paginates_per 4 

    has_many :brand_partners, dependent: :destroy

    validates :name, presence: true, length: {in: 2..30}
    validates :description, presence: true
end
