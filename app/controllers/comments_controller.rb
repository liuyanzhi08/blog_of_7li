class CommentsController < ApplicationController
  load_and_authorize_resource #cancan use to authorize
  skip_authorize_resource :only => :create

  def create
    @comment = Comment.new(params[:comment])
    @blog = Blog.find(params[:blog_id])
    @blog.comments << @comment

    @user = User.find_by_email_and_admin("77svli@gmail.com",true)
    @notice = Notice.new(:comment_blog_id => params[:blog_id], :comment_floor => params[:comment_floor])
    @user.notices << @notice
    @user.save
    @comment.notices << @notice


    if @blog.save
      redirect_to blog_url(@blog), notice: "Thanks for your comment"
    else
      redirect_to blog_url(@blog), alert: "#{@comment.errors.full_messages.first}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to blog_url(params[:blog_id]), notice: "Comment deleted"
    else
      redirect_to blog_url(params[:blog_id]), alert: "Failed to delete the comment"
    end
  end
end
