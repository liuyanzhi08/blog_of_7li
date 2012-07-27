class BlogsController < ApplicationController
  # GET /blogs
  # GET /blogs.json

  load_and_authorize_resource #cancan use to authorize
  skip_authorize_resource :only => :tag

  def index
    @blogs = Blog.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def new
    @blog = Blog.new
    @tags = Blog.tag_counts

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
      format.js{ render :layout => false }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
    @tags = @blog.tags
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(params[:blog])
    # add tags
    commit_tag

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])
    #update tags
    commit_tag

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  #show blogs in tags
  def tag
    @blogs = Blog.tagged_with(params[:tag]).order("created_at DESC")
    @tag_name = params[:tag]
  end

private
  def commit_tag
    all_tags = Blog.tag_counts
    blog_tags = []

    all_tags.each do |tag|
      name = tag.name
      blog_tags << params[name]
    end

    params[:tag_to_add].split.each do |tag|
      blog_tags << tag
    end
    @blog.tag_list = blog_tags
  end
end
