class RemovePasswordDigestFromKingsYangonUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :kings_yangon_users, :password_digest, :string
  end
end
