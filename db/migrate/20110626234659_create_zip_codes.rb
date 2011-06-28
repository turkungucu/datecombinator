class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state

      t.timestamps
    end
    
    add_index :zip_codes, :zip, :unique => true
  end
end
