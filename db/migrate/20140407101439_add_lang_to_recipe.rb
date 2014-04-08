class AddLangToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :lang, :string
  end
end
