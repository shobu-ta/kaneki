class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.string :status

      t.timestamps
    end
  end
end
