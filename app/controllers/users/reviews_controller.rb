class Users::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:new, :create, :edit, :update, :destroy]

  def new
    @review = @menu.reviews.new
  end

  def create
    # 対象メニューに紐づいたレビューを生成
    @review = @menu.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "レビューが投稿されました！"
      redirect_to users_menu_reviews_path(@menu)
    else
      render :new
    end
  end

  def edit
    @review = @menu.reviews.find(params[:id])
  end

  def update
    @review = @menu.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューが更新されました！"
      redirect_to users_reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review = @menu.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = "レビューが削除されました！"
    redirect_to users_reviews_path
  end

  def index
    @reviews = current_user.reviews.includes(:menu)
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_menu
    @menu = Menu.find_by(id: params[:menu_id])
    unless @menu
      flash[:alert] = "対象のメニューが見つかりません。"
      redirect_to menus_path
    end
  end
end