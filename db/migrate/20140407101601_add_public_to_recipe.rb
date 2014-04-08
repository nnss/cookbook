class AddPublicToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :public, :boolean
  end
end
