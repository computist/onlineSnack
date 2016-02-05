class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.text :items
      # format: dish_id:number_dish2_id:number_...
      t.boolean :paid
      t.integer :status
      # 1 open 0 finish 2 cancelled
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
