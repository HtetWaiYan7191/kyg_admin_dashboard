class RemoveUserReferencesFromBlogs < ActiveRecord::Migration[7.1]
  def change
    remove_reference :blogs, :user, foreign_key: true
  end
end
