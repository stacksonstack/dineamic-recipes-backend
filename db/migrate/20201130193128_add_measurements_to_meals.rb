class AddMeasurementsToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :measurement, :text, array: true, default: []
    add_column :meals, :ingredient, :text, array: true, default: []
  end
end