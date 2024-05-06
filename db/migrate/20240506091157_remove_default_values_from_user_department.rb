class RemoveDefaultValuesFromUserDepartment < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :department, nil
  end
end
