# encoding: utf-8
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.references :shipping,:nulll=>false
      t.references :payment,:null=>false
      t.integer :total_price, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
