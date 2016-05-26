class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :checkin
      t.string :checkout

      t.timestamps null: false
    end
  end
end
