class Ingredient < ActiveRecord::Base
  attr_accessible :measure, :name, :unit
  validates_presence_of :name
end
