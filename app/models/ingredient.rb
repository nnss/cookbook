class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :amount, :name, :unit, :ingredients_attributes
  validates_presence_of :name
end
