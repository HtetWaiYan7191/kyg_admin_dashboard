class BrandPartner < ApplicationRecord
  paginates_per 4 
  
  belongs_to :brand_category
  has_one_attached :image
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 200 }
  validates :brand_category, presence: true
end
