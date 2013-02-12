class Recipe < ActiveRecord::Base
  belongs_to :user
  attr_accessible :instructions, :title, :yield, :category_ids, :ingredient_ids
  has_and_belongs_to_many :categories

  has_many :ingredients, :dependent => :destroy
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a['name'].blank? }, :allow_destroy => true


end
