class CreateClickOuts < ActiveRecord::Migration
  def change
    create_table :click_outs do |t|
      t.references :profile
      t.string :ip_address
      t.timestamp :click_time     
    end
    
    add_index :click_outs, :profile_id
  end
end
