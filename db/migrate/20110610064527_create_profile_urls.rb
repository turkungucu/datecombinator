class CreateProfileUrls < ActiveRecord::Migration
  def change
    create_table :profile_urls do |t|
      t.string :url
      t.string :display_name
      t.references :profile

      t.timestamps
    end
    add_index :profile_urls, :profile_id
  end
end
