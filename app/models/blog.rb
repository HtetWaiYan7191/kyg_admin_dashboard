class Blog < ApplicationRecord
  belongs_to :category
  has_one_attached :image  
  has_rich_text :content
  
  paginates_per 4 

  validates :content, presence: true  
  validates :category_id, presence: true
  validates :views_count, numericality: { integer: true}
  validates :blog_status, presence: true, inclusion: { in: %w(pending approve deny) }
  validates :delete_flg, inclusion: { in: [true, false] }
  validates :title, presence: true, length: { maximum: 50 }

  enum blog_status: { pending: 0, approve: 1, deny: 2 }

end
