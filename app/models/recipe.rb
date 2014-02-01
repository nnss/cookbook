class Recipe < ActiveRecord::Base
  belongs_to :user
  attr_accessible :instructions, :title, :yield, :tag_list, :ingredient_ids, :ingredients_attributes, :user_id
  acts_as_taggable
  #has_and_belongs_to_many :categories

  acts_as_commentable
  #@recipe = Article.find(params[:id])
  #@user_who_commented = @current_user
  #@comment = Comment.build_from( @recipe, @user_who_commented.id, "Hey guys this is my comment!" )


  has_many :ingredients, :dependent => :destroy
  #accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a['name'].blank? }, :allow_destroy => true
  #accepts_nested_attributes_for :ingredients, reject_if:  lambda { |a| a['name'].blank? }, allow_destroy:  true
  accepts_nested_attributes_for :ingredients, allow_destroy:  true

  validates_presence_of :title, :instructions
end
