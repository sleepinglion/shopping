class CreateProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :products do |t|
      t.references :product_category,:nulll=>false
      t.string :title, :null=>false, :limit=>60
      t.integer :price, :null=>false, :default => 0
      t.integer :shipping_price, :null=>false, :default => 0
      t.text :description, :null=>false
      t.integer :product_pictures_count, :null => false, :default => 0
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end

    add_foreign_key :products, :product_categories, on_delete: :cascade, on_update: :cascade     
  end
end
