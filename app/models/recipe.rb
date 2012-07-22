class Recipe < ActiveRecord::Base
  attr_accessible :date, :description, :instructions, :title
  validates_presence_of :title, :instructions
  has_many :categories
  has_many :ingredients
  has_many :comments


  accepts_nested_attributes_for :categories, :allow_destroy => true,
      :reject_if => proc {|attrs| atrrs.all? {|k,v| v.blank?}}
  accepts_nested_attributes_for :ingredients, :allow_destroy => true,
      :reject_if => proc {|attrs| atrrs.all? {|k,v| v.blank?}}
end
