class CreateKingsYangonUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :kings_yangon_users do |t|
      t.string :school_id
      t.string :password_digest

      t.timestamps
    end
  end
end
