class Reservation < ApplicationRecord
  belongs_to :user_id
  has_many :reservation_details, dependent: :destroy
  accepts_nested_attributes_for :reservation_details, reject_if: :all_blank, allow_destroy: true

  
end
