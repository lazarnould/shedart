class AddWorkshopRefToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :workshop, index: true, foreign_key: true
  end
end
