class AddChangePasswordToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :change_password, :boolean, default: :false
  end
end
