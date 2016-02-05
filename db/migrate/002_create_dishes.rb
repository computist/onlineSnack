class CreateDishes < ActiveRecord::Migration
  def self.up
    create_table :dishes do |t|
      t.string :name, null:false
      t.string :store_name
      t.string :cuisine
      t.integer :spicy, default:0
      t.decimal :rate
      t.integer :rate_number
      t.decimal :price
      t.boolean :reserve, default: false
      t.boolean :deliver, default: false
      t.boolean :pickup, default: false
      t.string :img_l
      t.string :img_m
      t.string :img_s
      t.timestamps
    end
    add_index :dishes, :name,             unique: true
  end

  def self.down
    drop_table :dishes
  end
end
