class AddAcceptedToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :accepted, :boolean, null: false, default: false
  end
end
