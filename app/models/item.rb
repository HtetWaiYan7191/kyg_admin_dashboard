class Item < ApplicationRecord
  belongs_to :brand_partner
  has_many_attached :images
end
