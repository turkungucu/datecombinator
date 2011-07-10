class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user
      t.integer :profile_id

      t.timestamps
    end
    add_index :favorites, :user_id
  end
end
