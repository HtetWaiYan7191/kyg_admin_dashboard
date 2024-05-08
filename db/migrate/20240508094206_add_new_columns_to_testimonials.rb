class AddNewColumnsToTestimonials < ActiveRecord::Migration[7.1]
  def change
    add_column :testimonials, :batch_year, :date
    add_column :testimonials, :current_year_group, :string
  end
end
