class SessionsController < ApplicationController
  skip_before_filter :require_user
  def new
  end

  def create
    user = User.authenticate(params[:mail], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to back_or_default(root_url), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    Rails.logger.debug("root url/path: #{root_url} / #{root_path}")
    session[:user_id] = nil
    redirect_to redirect_back_or_default(root_path), :notice => "Logged out!"
  end
end
