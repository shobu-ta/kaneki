class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to admin_blogs_path, notice: "ブログを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to admin_blog_path(@blog), notice: "ブログを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to admin_blogs_path, notice: "ブログを削除しました"
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, images: [])
  end
end