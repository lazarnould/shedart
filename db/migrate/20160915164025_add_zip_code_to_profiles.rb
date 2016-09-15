class AddZipCodeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :zip_code, :string
  end
end
