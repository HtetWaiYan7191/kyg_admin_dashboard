class AddColumnsInUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :title, :string
    add_column :users, :position, :string 
    add_column :users, :role, :integer, default: 0 
    change_column :users, :department, :string
  end
end
