class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to admin_reservations_path, notice: "予約を削除しました"
  end
end
