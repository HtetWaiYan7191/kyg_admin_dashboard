class Testimonial < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 50 }
  validates :speech, presence: true
end
