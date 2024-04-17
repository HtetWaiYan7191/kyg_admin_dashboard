class Contact < ApplicationRecord
    validates :student_name, :parent_name,  presence: true, length: {maximum: 40}
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone_number, presence: true, length: {maximum: 12}, format: { with: /\A\+?[\d\s-]{7,15}\z/, message: "must be a valid phone number" }
    validates :birth_date, presence: true, comparison: {less_than: Date.current}
    validates :gender, presence: true, length: {maximum: 10 }
    validates :nationality, :current_school, :current_year_group, presence: true, length: {maximum: 50 }
    validates :address, presence: true, length: {maximum: 100 }
    validates :message, presence: true, length: { maximum: 500 }
end
