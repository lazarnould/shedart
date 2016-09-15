class AddApplicationToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :application, :string
  end
end
