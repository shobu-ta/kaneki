class Menu < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :reservation_details, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
