# encoding: utf-8
class CreateOrdersProducts < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
      t.references :order, :null=>false
      t.references :product, :null=>false
      t.integer :quantity, :null=>false, :default=>1
    end

    add_index :orders_products, :order_id
    add_index :orders_products, :product_id
    add_index :orders_products, [:order_id, :product_id], :unique=>true
  end
end
