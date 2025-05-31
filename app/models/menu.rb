class Menu < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :reservation_details, dependent: :destroy
end
