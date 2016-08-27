class AddPhotoToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :photo, :string
  end
end
