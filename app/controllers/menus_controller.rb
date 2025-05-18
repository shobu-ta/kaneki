class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def weekly
    @weekly_menus = Menu.where(weekly_menu: true)
  end

end