class Users::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
    @weekly_menus = Menu.where(weekly_menu: true)
  end

  def confirm
    @weekly_menus = Menu.where(weekly_menu: true)
    @selected_menus = {}
    @total_price = 0

    params[:quantities]&.each do |menu_id, quantity|
      menu = Menu.find(menu_id)
      quantity = quantity.to_i

      if quantity > 0
        @selected_menus[menu] = quantity
        @total_price += menu.price * quantity
      end
    end

    #  会員の氏名・電話番号は `current_user` から取得
    @name = current_user.name
    @phone_number = current_user.phone_number
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
  
    if @reservation.save
      flash[:notice] = "予約が完了しました！"
      redirect_to users_reservations_path
    else
      render :confirm
    end
  end

  def index
    @reservations = current_user.reservations.includes(:reservation_details)
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end
  
  
  private

  def reservation_params
    params.permit(:name, :phone_number, menus: [])
  end
end