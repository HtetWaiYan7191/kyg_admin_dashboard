class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {user: 0, admin: 1, management: 2}  
  paginates_per 4 
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { in: 3..20 }
  validates :department, presence: true
  validates :title, presence: true
  validates :position, presence: true, length: { in: 4..30 }
  validates :role, allow_blank: true, inclusion: { in: roles.keys }

  def self.create_with_default_password(attr={}) 
    default_password = 'password'
    self.create(attr.merge(password: default_password, password_confirmation: default_password))
  end

  def change_password?
    self.change_password
  end
  private
end
