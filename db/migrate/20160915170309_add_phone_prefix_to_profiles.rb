class AddPhonePrefixToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :phone_prefix, :string
  end
end
