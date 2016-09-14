class AddNameToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :name, :string
  end
end
