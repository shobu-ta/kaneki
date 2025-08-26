class MenusController < ApplicationController
  def index
    @menus = Menu.page(params[:page]).per(5)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def weekly
    @weekly_menus = Menu.where(weekly_menu: true)
  end

end