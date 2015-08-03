class CreateDishes < ActiveRecord::Migration
  def self.up
    create_table :dishes do |t|
      t.string :name, null:false
      t.string :location
      t.integer :spicy, default:0
      t.timestamps
    end
    add_index :dishes, :name,             unique: true
  end

  def self.down
    drop_table :dishes
  end
end
