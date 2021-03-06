class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_user
  helper_method :current_user, :isAdmin?

  def permission_denied
    flash[:error] = "Sorry, permission denied."
    respond_to do |format|
      format.html { redirect_to(:back) rescue redirect_to('/') }
      format.xml  { head :unauthorized }
      format.js   { head :unauthorized }
    end
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to log_in_path
      return false
    end
  end

  
  def isAdmin?(user=current_user)
    Group.isAdmin?(user)
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default,msg=nil)
    unless session[:return_to].nil?
      redirect_to session[:return_to], msg
    end
    session[:return_to] = nil
    redirect_to default, msg
  end

  def back_or_default(default)
    if session[:return_to].nil?
       session[:return_to] = nil
       return default
    else 
      t = session[:return_to]
      session[:return_to] = nil
      return t
    end
  end

  private

  def current_user
    #@current_user.group=
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
