class ChangeDiscountPercentageToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :items, :discount_percentage, :integer
  end
end
