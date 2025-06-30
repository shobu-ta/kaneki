class Users::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations.includes(:reservation_details)
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

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

    @name = current_user.name
    @phone_number = current_user.phone_number
    @reservation = Reservation.new(
      name: @name,
      phone_number: @phone_number,
      total_price: @total_price,
      status: "予約"
    )

    @selected_menus.each do |menu, quantity|
      @reservation.reservation_details.new(
        menu_id: menu.id,
        quantity: quantity,
        price: menu.price
      )
    end
  end

  def create
    @reservation = current_user.reservations.new(reservations_params)

    if @reservation.save
      flash[:notice] = "予約が完了しました！"
      redirect_to users_reservations_path
    else
      render :confirm
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to users_reservations_path, notice: "予約をキャンセルしました。"
  end

  private

  def reservations_params
    params.require(:reservation).permit(
      :name, :total_price, :phone_number,
      reservation_details_attributes: [:id, :menu_id, :price, :quantity, :_destroy]
    )
  end
end