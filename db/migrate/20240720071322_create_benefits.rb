class CreateBenefits < ActiveRecord::Migration[7.1]
  def change
    create_table :benefits do |t|
      t.string :content, null: false
      t.string :remark
      t.references :brand_partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
