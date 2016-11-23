# encoding: utf-8
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :null=>false, :limit=>60
      t.integer :price, :null=>false, :default => 0
      t.integer :shipping_price, :null=>false, :default => 0      
      t.text :description, :null=>false
      t.integer :product_pictures_count, :null => false, :default => 0      
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
