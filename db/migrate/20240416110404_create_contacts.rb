class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :student_name
      t.string :parent_name
      t.string :email
      t.string :phone_number
      t.date :birth_date
      t.string :gender
      t.string :nationality
      t.string :address
      t.string :current_school
      t.string :current_year_group
      t.string :message

      t.timestamps
    end
  end
end
