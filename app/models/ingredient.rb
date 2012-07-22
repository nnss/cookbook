class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :measure, :name, :unit
end
