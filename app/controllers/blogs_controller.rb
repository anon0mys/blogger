class BlogsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update delete]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = 'Blog was successfully created.'
      redirect_to blogs_path
    else
      flash[:fail] = 'Blog was not created'
      redirect_to new_blog_path
    end
  end

  def update
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:success] = 'Blog was successfully updated.'
      redirect_to blogs_path
    else
      flash[:fail] = 'Blog was not created'
      redirect_to new_blog_path
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:success] = 'Blog successfully deleted'
      redirect_to blogs_path
    else
      flash[:fail] = 'Blog was not deleted'
      redirect_to blog_path(@blog)
    end
  end

  private
    def blog_params
      params.fetch(:blog, {})
    end
end
