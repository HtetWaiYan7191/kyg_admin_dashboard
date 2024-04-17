class RenameStatusToBlogStatusInBlogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :blogs, :status, :blog_status
    change_column_default :blogs, :blog_status, from: nil, to: 0
  end
end
