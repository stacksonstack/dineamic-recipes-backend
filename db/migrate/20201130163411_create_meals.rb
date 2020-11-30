class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :image
      t.string :category
      t.string :origin
      t.string :youtube_link
      t.text :measurements
      t.text :ingredients
      t.text :instructions
      t.timestamps
    end
  end
end
