class Item < ApplicationRecord
  belongs_to :brand_partner
  has_many_attached :images

  validates :name, presence: true, length: {maximum: 50}
  validates :price, :discount_percentage, presence: true, numericality: {allow_float: true}
  validates :brand_partner, presence: true
end
