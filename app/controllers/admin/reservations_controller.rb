class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.includes(:user, :reservation_details).order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      flash[:notice] = "予約情報を更新しました。"
      redirect_to admin_reservation_path(@reservation)
    else
      flash[:alert] = "予約情報の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    flash[:notice] = "予約を削除しました。"
    redirect_to admin_reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:status, :date)
  end
end