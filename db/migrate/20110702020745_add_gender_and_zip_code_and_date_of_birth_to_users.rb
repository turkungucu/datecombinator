class AddGenderAndZipCodeAndDateOfBirthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :zip_code, :string
    add_column :users, :date_of_birth, :date
  end
end
