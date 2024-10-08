class Blog < ApplicationRecord
  belongs_to :category
  has_many_attached :images
  has_many_attached :videos  

  validates :content, presence: true
  validates :category_id, presence: true
  validates :views_count, numericality: { integer: true}
  validates :blog_status, presence: true, inclusion: { in: %w(pending approve reject) }
  validates :delete_flg, inclusion: { in: [true, false] }
  validates :title, presence: true, length: { maximum: 255 }

  enum blog_status: { pending: 0, approve: 1, deny: 2 }

end
