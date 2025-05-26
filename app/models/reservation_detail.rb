class ReservationDetail < ApplicationRecord
  belongs_to :reservation
  belongs_to :menu

  def total_price
    price * quantity
  end

end
