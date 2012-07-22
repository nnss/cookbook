class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :recipe

      t.timestamps
    end
    add_index :categories, :recipe_id
  end
end
