class AddEthnicityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ethnicity, :string
  end
end
