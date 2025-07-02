class Admin::DashboardController < ApplicationController
    before_action :authenticate_admin! 

    def index
    end

    def search
      @scope = params[:scope]        
      @mode  = params[:mode]         
      @q     = params[:q].to_s.strip
  
      @results =
        case @scope
        when 'user'
          users = User.all
          if @mode == 'exact'
            users.where(name: @q)
          else
            users.where("name LIKE :kw OR email LIKE :kw OR phone_number LIKE :kw", kw: "%#{@q}%")
          end
        when 'menu'
          menus = Menu.all
          if @mode == 'exact'
            menus.where(name: @q)
          else
            menus.where("name LIKE ?", "%#{@q}%")
          end
        else
          []  
        end
    end
  
  end

