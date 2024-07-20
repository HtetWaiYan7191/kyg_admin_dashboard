class Benefit < ApplicationRecord
  belongs_to :brand_partner

  validates :content, presence: true
  validates :brand_partner, presence: true
  validates :brand_partner_id, presence: true
end
