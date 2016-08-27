class AddDescriptionToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :description, :string
  end
end
