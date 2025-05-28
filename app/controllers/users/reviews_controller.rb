class Users::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:new, :create]

  def index
    @menu = Menu.find(params[:menu_id])
    @reviews = @menu.reviews.includes(:user)
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = @menu.reviews.build
  end

  def create
    @review = @menu.reviews.build(review_params)
    @review.user = current_user
    @review.reservation = current_user.reservations.find(params[:reservation_id])

    if @review.save
      flash[:notice] = "レビューが投稿されました！"
      redirect_to users_menu_reviews_path(@menu)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
end