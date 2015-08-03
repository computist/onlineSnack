class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      #t.string :phone, null:false
      t.string :username, null:false
      t.string :password_hash, null:false
      t.boolean :activated, null:false, default:false
      t.datetime :last_login
      t.string :access_token
      t.datetime :access_token_create_time
      t.timestamps
    end
    add_index :users, :username,             unique: true
  end

  def self.down
    drop_table :users
  end
end
