class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.decimal :price
      t.decimal :discount_percentage
      t.references :brand_partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
