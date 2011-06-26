class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :gender
      t.string :seeking_gender
      t.date :date_of_birth
      t.string :zip_code
      t.string :headline
      t.text :description

      t.timestamps
    end
  end
end
