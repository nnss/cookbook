class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  attr_accessible :body
  validates_presence_of :body
end
