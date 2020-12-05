class CreateOrders < ActiveRecord::Migration[4.2]
  def change
    create_table :orders do |t|
      t.references :user
      t.references :shipping,:nulll=>false
      t.references :payment,:null=>false
      t.integer :total_price, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
    
    add_foreign_key :orders, :users, on_delete: :cascade, on_update: :cascade 
    add_foreign_key :orders, :shippings, on_delete: :cascade, on_update: :cascade 
    add_foreign_key :orders, :payments, on_delete: :cascade, on_update: :cascade   
  end
end
