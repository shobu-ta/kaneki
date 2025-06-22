class Admin::MenusController < ApplicationController
    before_action :authenticate_admin! 

    def index
      @menus = Menu.all
    end

    def new
      @menu = Menu.new
    end

    def create
      @menu = Menu.new(menu_params)
      if @menu.save
        redirect_to admin_menus_path, notice: "メニューを追加しました!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @menu = Menu.find(params[:id])
    end

    def update
      @menu = Menu.find(params[:id])
      if @menu.update(menu_params)
        redirect_to admin_menus_path, notice: "メニューを更新しました!"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @menu = Menu.find(params[:id])
      @menu.destroy
      redirect_to admin_menus_path, notice: "メニューを削除しました!"
    end

    private

    def menu_params
      params.require(:menu).permit(:name, :description, :price, :image, :weekly_menu)
    end
  
end