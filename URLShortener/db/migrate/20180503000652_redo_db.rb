class RedoDb < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      
      t.timestamps
    end
    add_index :users, :email, unique: true
    
    create_table :shortened_urls do |t|
      t.string :long_url, null:false
      t.string :short_url, null:false
      t.integer :user_id, null:false
      
      t.timestamps
    end
    add_index :shortened_urls, [:long_url, :short_url]
    add_index :shortened_urls, :user_id
    
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :shortened_url_id, null: false
      
      t.timestamps
    end
    add_index :visits, :user_id
    add_index :visits, :shortened_url_id
  end
end
