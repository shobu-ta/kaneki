class Menu < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  #def resized_image
   # image.variant(resize_to_fill: [400, 300]).processed
  #end

end
