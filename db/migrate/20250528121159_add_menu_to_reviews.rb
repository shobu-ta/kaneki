class AddMenuToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :menu, null: false, foreign_key: true
  end
end
