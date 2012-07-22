class Recipe < ActiveRecord::Base
  attr_accessible :date, :description, :instructions, :title
end
