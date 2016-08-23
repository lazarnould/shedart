class AddOwnerToUser < ActiveRecord::Migration
  def change
    add_column :users, :owner, :boolean, null: false, default: false
  end
end
