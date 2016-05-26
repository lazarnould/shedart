class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :city
      t.string :address
      t.integer :size
      t.integer :price
      t.boolean :shared

      t.timestamps null: false
    end
  end
end
