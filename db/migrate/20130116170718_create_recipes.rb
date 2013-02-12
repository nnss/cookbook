class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.references :user
      t.string :yield
      t.text :instructions

      t.timestamps
    end
    add_index :recipes, :user_id
  end
end
