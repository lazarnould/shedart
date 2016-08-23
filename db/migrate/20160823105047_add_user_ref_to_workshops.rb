class AddUserRefToWorkshops < ActiveRecord::Migration
  def change
    add_reference :workshops, :user, index: true, foreign_key: true
  end
end
