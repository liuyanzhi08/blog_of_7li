class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @blog = Blog.find(params[:blog_id])

    if @blog.comments << @comment
      redirect_to blog_url(@blog), notice: "Successfully comment"
    end

  end

  def destroy
  end
end
