class BrandCategory < ApplicationRecord
    has_many :brand_partners

    validates :name, presence: true, length: {in: 4..30}
    validates :description, presence: true
end
