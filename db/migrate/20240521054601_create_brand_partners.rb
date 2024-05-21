class CreateBrandPartners < ActiveRecord::Migration[7.1]
  def change
    create_table :brand_partners do |t|
      t.string :name
      t.references :brand_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
