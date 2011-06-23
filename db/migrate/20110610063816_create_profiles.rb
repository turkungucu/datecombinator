class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender
      t.date :date_of_birth
      t.string :zip_code
      t.text :profile

      t.timestamps
    end
  end
end
