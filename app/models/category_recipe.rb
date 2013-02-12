class CategoriesRecipes < ActiveRecord::Base
  belongs_to :category
  belongs_to :recipe

  attr_accessible :category_id, :recipe_id
  accepts_nested_attributes_for :recipes
  accepts_nested_attributes_for :categories
end
