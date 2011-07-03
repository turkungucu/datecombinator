class AddEthnicityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :ethnicity, :string
  end
end
