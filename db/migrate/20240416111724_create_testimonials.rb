class CreateTestimonials < ActiveRecord::Migration[7.1]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.text :speech

      t.timestamps
    end
  end
end
