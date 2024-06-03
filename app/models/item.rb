class Item < ApplicationRecord
  belongs_to :brand_partner
  has_many_attached :images

  validates :name, presence: true, length: {maximum: 50}
  validates :price, presence: true, numericality: {allow_float: true}
  validates :discount_percentage, allow_nil: true, numericality: {allow_integer: true}
  validates :brand_partner, presence: true
end
