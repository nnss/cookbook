class CommentsController < ApplicationController
  skip_before_filter :require_user, only: [:show, :index]
  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    #Rails.logger.debug("got obj as #{@obj}")
    #Rails.logger.debug("got current user as: #{current_user.public_methods.sort}")
    #Rails.logger.debug("got current user as: #{current_user.id}")
    #Rails.logger.debug("got body as #{@comment_hash[:body]}")
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    if @comment.save
      render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
    else
      render :js => "alert('error saving comment');"
    end
  end
end
