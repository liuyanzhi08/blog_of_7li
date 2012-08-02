class ArchiveController < ApplicationController
  def index
    @blogs = Blog.all
    @tags = Blog.tag_counts

    first_blog_year = Blog.first.created_at.year
    last_blog_year = Blog.last.created_at.year
    @years = first_blog_year..last_blog_year

    @months = 1..12

  end

  def search
    @blogs = Blog.find(:all, "created_at DESC")
    if params[:year]
      if params[:year] != "all"
        @blogs.select!{|blog| blog.created_at.year.to_s == params[:year]}
      end
    end

    if params[:month]
      if params[:month] != "all"
        @blogs.select!{|blog| blog.created_at.month.to_s == params[:month]}
      end
    end

    if params[:tag]
      if params[:tag] != "all"
        @blogs.select!{|blog| blog.tag_list.include?(params[:tag])}
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end

