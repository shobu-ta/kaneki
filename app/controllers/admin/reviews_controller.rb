class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    menu = Menu.find(params[:menu_id])
    review = menu.reviews.find(params[:id])
    review.destroy
    flash[:notice] = "レビューを削除しました。"
    redirect_to edit_admin_menu_path(menu)
  end
  
end