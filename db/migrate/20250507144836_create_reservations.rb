class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.string :name
      t.string :phone_number
      t.integer :total_price
      t.timestamps
    end
  end
end
