module ApplicationHelper

  def isAdmin?(user=current_user)
    Group.isAdmin?(user)
  end

  # owners, admins and editors should be able to edit
  def canEdit?(user=current_user,owner=nil)
    return false if user.nil?
    return true if user.name == owner.name
    return true if self.isAdmin?(user)
    false
  end

  # any valid user should create recipes
  def canCreate?(user=current_user)
    return false if user.nil?
    true
  end

  def canPublish?(user=current_user)
    return true if isAdmin?(user)
    false
  end

  # admin and editors should be able to delete recipes
  def canDelete?(user=current_user,owner=nil)
    return false if user.nil?
    #Rails.logger.debug("I got owner as #{owner.name} and user as #{user.name}")
    return true if self.isAdmin?(user)
    false
  end

end
