class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.date :date
      t.string :description
      t.text :instructions

      t.timestamps
    end
  end
end
