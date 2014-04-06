class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :lang, :text, :title, :tag_list, :user_id

  acts_as_taggable
end
