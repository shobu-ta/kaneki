class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_details, dependent: :destroy
  belongs_to :menu
end
