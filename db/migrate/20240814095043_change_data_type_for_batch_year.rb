class ChangeDataTypeForBatchYear < ActiveRecord::Migration[7.1]
  def change
    remove_column :testimonials, :batch_year, :date
    add_column :testimonials, :batch_year, :integer
  end
end
