class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.text :content
      t.integer :views_count, default: 0
      t.integer :status, default: 0
      t.boolean :delete_flg, default: false
      t.string :title

      t.timestamps
    end
  end
end
