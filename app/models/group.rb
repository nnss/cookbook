class Group < ActiveRecord::Base
  belongs_to :user
  attr_accessible :group

  def self.isAdmin?(user)
    return true if Group.find_by_user_id(user.id).group.to_s == 'ADMIN'
    false
  end

  def self.getGroup(user)
    Group.find_by_user_id(user.id).group.to_s
  end
end
