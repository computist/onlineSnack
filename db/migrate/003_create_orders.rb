class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.text :items
      # format: id:name:price:number_id2:name2:price2:number2
      t.integer :price
      # in cent
      t.integer :item_count
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
