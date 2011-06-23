class CreateProfileImages < ActiveRecord::Migration
  def change
    create_table :profile_images do |t|
      t.string :url
      t.references :profile

      t.timestamps
    end
    add_index :profile_images, :profile_id
  end
end
