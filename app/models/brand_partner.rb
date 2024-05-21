class BrandPartner < ApplicationRecord
  belongs_to :brand_category
  has_one_attached :image
end
