class DropRole < ActiveRecord::Migration
  def up
    drop_table :roles
  end

  def down
    create_table :roles do |t|
      t.boolean :owner

      t.timestamps
    end
  end
end
