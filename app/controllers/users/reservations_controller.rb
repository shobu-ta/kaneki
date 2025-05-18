class Users::ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def new
    @reservation = Reservation.new
    @weekly_menus = Menu.where(weekly_menu: true) # 今週のメニューを取得
  end

  def confirm
    @weekly_menus = Menu.where(weekly_menu: true)
    @selected_menus = {}
    @total_price = 0
  
    # 🔥 予約フォームで入力された氏名・電話番号を取得
    @name = params[:name].present? ? params[:name] : nil
    @phone_number = params[:phone_number].present? ? params[:phone_number] : nil
  
    params[:quantities]&.each do |menu_id, quantity|
      menu = Menu.find(menu_id)
      quantity = quantity.to_i
  
      if quantity > 0
        @selected_menus[menu] = quantity
        @total_price += menu.price * quantity
      end
    
  end
  
    # フォームで入力された氏名・電話番号を取得
    @name = params[:name].present? ? params[:name] : (current_user.present? ? current_user.name : "未登録")
    @phone_number = params[:phone_number].present? ? params[:phone_number] : (current_user.present? ? current_user.phone_number : "未登録")
  end


  def create
    @reservation = Reservation.new(reservation_params)

    if user_signed_in?
      @reservation.user = current_user
    end

    if @reservation.save
      redirect_to users_reservations_path, notice: "予約が完了しました"
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :phone_number, :date, :status)
  end
end