class AddUserTypeToKingsYangonUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :kings_yangon_users, :user_type, :integer, default: 0
  end
end
