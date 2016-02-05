class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, null:false
      t.string :password_hash, null:false
      t.boolean :activated, null:false, default:false
      t.string :first_name
      t.string :last_name
      t.datetime :last_login
      t.string :access_token
      t.datetime :access_token_create_time
      t.text :cart, default:""
      # format: dish_id:number;dish2_id:number;...
      t.timestamps
    end
    add_index :users, :email,             unique: true
  end

  def self.down
    drop_table :users
  end
end
