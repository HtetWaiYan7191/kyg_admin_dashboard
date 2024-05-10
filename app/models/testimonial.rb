class Testimonial < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 50 }
  validates :speech, presence: true, length: { maximum: 500 }
  validate :batch_year_cannot_be_two_year_future 

  private 
  def batch_year_cannot_be_two_year_future
    if batch_year.present? && batch_year > Date.current.year + 2
      errors.add(:batch_year, ' cannot be two years into the future')
    end
  end
  
end
