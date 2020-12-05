class CreateOrdersProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :orders_products do |t|
      t.references :order, :null=>false
      t.references :product, :null=>false
      t.integer :quantity, :null=>false, :default=>1
    end

    add_foreign_key :orders_products, :orders, on_delete: :cascade, on_update: :cascade
    add_foreign_key :orders_products, :products, on_delete: :cascade, on_update: :cascade
    add_index :orders_products, [:order_id, :product_id], :unique=>true
  end
end
