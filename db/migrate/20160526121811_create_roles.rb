class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.boolean :owner

      t.timestamps null: false
    end
  end
end
