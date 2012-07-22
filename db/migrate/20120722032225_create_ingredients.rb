class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.float :unit
      t.string :measure
      t.string :name

      t.timestamps
    end
  end
end
